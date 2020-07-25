# Autoscaling based on condition of CPU Utilization 

Pre-Requisites:
----------
    -   Install terraform(v0.12)
    -   Install Git
    
Clone the code from github
----------
    https://github.com/VamsiTechTuts/awsautomationrepo.git
    cd terraform-cpumetricsautoscaling

Initilise terraform:
----------
    terraform init
Plan:
----
    terraform plan
Apply:
----
    terraform apply
Goto Autoscaling group and check Autoscaling conditions attached to our autoscaling. 

Now we need to increase CPU Utilization using below command
    
    for i in 1 2 3 4; do while : ; do : ; done & done
   
Check CPU Utilization using TOP command
    
    top
    
It will scaleup instances as per condition.

Again reduce CPU Utilization by using below command
  
    for i in 1 2 3 4; do kill %$i; done
    
It will scaledown instances as per condition.

CleanUp:
------
    terraform destroy
