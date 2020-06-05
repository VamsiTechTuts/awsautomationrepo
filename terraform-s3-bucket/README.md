# Create S3 Bucket

Step1:
-------
First we need to keep AWS access key and secret access key with in credentials file

    vi /root/.aws/credentials
    ------------------------------------------
    [default]
    aws_access_key_id = 
    aws_secret_access_key = 
    ------------------------------------------
Step2:
------
Clone code from source code management

    git clone https://github.com/VamsiTechTuts/awsautomationrepo.git
    cd terraform_s3_bucket
Step3:
------
Now run terraform init command. This command will download and install the proper version of the AWS provider for your project and add it in the directory .terraform

    terraform init
Step4:
------
Now run terraform plan to make sure configuration is ready to be applied

    terraform plan
Step5:
------
Let’s run terraform apply. This command shows you what are the changes which are going to be applied to your infrastructure and it will prompt for your confirmation. Enter ‘yes’ when it prompts you for the confirmation.

    terraform apply

CleanUP:
--------
If you want to remove s3 bucket just give below command

    terraform destroy   
