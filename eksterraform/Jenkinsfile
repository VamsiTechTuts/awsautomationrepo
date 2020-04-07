pipeline {

   parameters {
    choice(name: 'action', choices: 'create\ndestroy', description: 'Create/update or destroy the eks cluster.')
	string(name: 'cluster', defaultValue : 'demo', description: "EKS cluster name;eg demo creates cluster named eks-demo.")
  }
  
  agent any

  stages {
    stage('checkout') {
        steps {
            git 'https://github.com/VamsiTechTuts/awsautomationrepo.git'
        }
    }
	stage('Setup') {
		steps {
			script {
				currentBuild.displayName = "#" + env.BUILD_NUMBER + " " + params.action + " eks-" + params.cluster
				plan = params.cluster + '.plan'
			}
		}
	}
    stage('Set Terraform path') {
        steps {
            script {
                def tfHome = tool name: 'terraform'
                env.PATH = "${tfHome}:${env.PATH}"
            }
            sh 'terraform -version'
        }
    }
    stage('TF Plan') {
      when {
        expression { params.action == 'create' }
		}	
		steps {
			script {
			dir('eksterraform') {
				withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'AWS_Credentials', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
				sh """
					terraform init
					terraform workspace new ${params.cluster} || true
					terraform workspace select ${params.cluster}
					terraform plan \
						-var cluster-name=${params.cluster} \
						-out ${plan}
					echo ${params.cluster}
				"""
				}
			}
        }
      }
    }
    stage('TF Apply') {
      when {
        expression { params.action == 'create' }
		}	
		steps {
			script {
			dir('eksterraform') {
				withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'AWS_Credentials', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
				if (fileExists('$HOME/.kube')) {
					echo '.kube Directory Exists'
				} else {
				sh 'mkdir -p $HOME/.kube'
				}
				sh """
					terraform apply -input=false -auto-approve ${plan}
					terraform output kubeconfig > $HOME/.kube/config
				"""
				sh 'sudo chown $(id -u):$(id -g) $HOME/.kube/config'
				sleep 30
				sh 'kubectl get nodes'
				}
			}
        }
      }
    }
    stage('TF Destroy') {
      when {
        expression { params.action == 'destroy' }
      }
      steps {
        script {
			dir('eksterraform') {
				withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'AWS_Credentials', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
				sh """
				terraform workspace select ${params.cluster}
				terraform destroy -auto-approve
				"""
				}
			}
        }
      }
    }
  }
}
