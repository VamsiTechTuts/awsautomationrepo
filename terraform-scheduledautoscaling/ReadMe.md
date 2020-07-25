# Schedule Autoscaling using Terraform

Pre-Requisites:
----------
    -   Install terraform(v0.12)
    -   Install Git
Clone the code from github
----------
    https://github.com/VamsiTechTuts/awsautomationrepo.git
    cd terraform-scheduledautoscaling

Goto variables.tf file and change values for start, end and recurrence as per UTC time zone

Initilise terraform:
----------
    terraform init
Plan:
----
    terraform plan
Apply:
----
    terraform apply
Goto Autoscaling group and check Schedule Autoscaling condition attached to our autoscaling. It will scaleup to desired capacity as per given.
Once end time reached it scaledown to desired capacity as per given.

CleanUp:
------
    terraform destroy
