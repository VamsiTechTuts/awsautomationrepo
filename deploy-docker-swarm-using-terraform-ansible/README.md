##deploy-docker-swarm-using-terraform-ansible
---

Pre-requisites:
----
    - Install Git
    - Install Unzip
    - Install Terraform
    - Install Ansible
    
Install Git
----
    apt-get install git -y
    
Install Unzip:
----
    apt-get install unzip -y

Install Terraform:
----
    wget https://releases.hashicorp.com/terraform/0.12.25/terraform_0.12.25_linux_amd64.zip
    unzip terraform_0.12.25_linux_amd64.zip
    mv terraform /usr/bin/
    terraform -version
    
Install Ansible:
----
    sudo apt-add-repository ppa:ansible/ansible
Press ENTER to accept the PPA addition  
     
     sudo apt-get update
     sudo apt-get install ansible -y

Clone Source code from Github:
------
    git clone https://github.com/VamsiTechTuts/awsautomationrepo.git
    cd awsautomationrepo/deploy-docker-swarm-using-terraform-ansible
Edit Key_name with in the variable.tf file
----
    vi variable.tf
    
Keep Access_key and Secret_Access_key values with in the main.tf file
-----

    terraform init
    terraform plan
    terraform apply
    
We will get outputs as shown below
-------


Keep these IP's with in this Path:     


