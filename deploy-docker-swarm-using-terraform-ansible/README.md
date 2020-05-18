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
![2](https://user-images.githubusercontent.com/63221837/82235801-d8166080-9950-11ea-965d-2db0e552c267.png)

Keep Access_key and Secret_Access_key values with in the main.tf file
-----
    vi main.tf
![1](https://user-images.githubusercontent.com/63221837/82235636-97b6e280-9950-11ea-951c-af865556b204.png)

    terraform init
    terraform plan
    terraform apply
    
We will get outputs as shown below
-------
![3](https://user-images.githubusercontent.com/63221837/82235924-fda36a00-9950-11ea-8838-1764f3a806af.png)

Keep these IP's with in this Path: 
----
    vi /etc/ansible/hosts
![5](https://user-images.githubusercontent.com/63221837/82237118-ccc43480-9952-11ea-9104-2a90ec7d1815.png)

Create ansible user and set password
------
    adduser ansible
    
Enable sudo permissions for ansible user:
-----
    sudo echo -e "ansible ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
    
Enable PasswordAuthentication:
------
    sudo sed -i '/PasswordAuthentication no/c\PasswordAuthentication yes' /etc/ssh/sshd_config
    
Restart sshd service:
----
    service sshd restart
    
Switch to ansible user and create key
-------
    su - ansible
    ssh-keygen
    
Copy public key into created master and worker servers
------------
    ssh-copy-id ansible@3.88.194.138
    ssh-copy-id ansible@3.92.208.108
    ssh-copy-id ansible@3.84.190.227
Say yes and give password as ansible for master and worker servers

Move playbook to /home/ansible palce
--------
    sudo mv /root/awsautomationrepo/deploy-docker-swarm-using-terraform-ansible/playbook.yml /home/ansible
    
Run playbook using below command:
------
    ansible-playbook playbook.yml
    
Connect to Master server and check nodes:
------
    ssh ansible@3.88.194.138
    sudo docker node ls
![4](https://user-images.githubusercontent.com/63221837/82236982-92f32e00-9952-11ea-959b-8f34bbdb4925.png)
