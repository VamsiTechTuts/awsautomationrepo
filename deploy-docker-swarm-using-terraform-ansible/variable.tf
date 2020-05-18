variable "aws_region" {
  description = "AWS region on which we will setup the swarm cluster"
  default = "us-east-1"
}

variable "ami" {
  description = "Amazon Linux AMI"
  default = "ami-085925f297f89fce1"
}

variable "instance_type" {
  description = "Instance type"
  default = "t2.micro"
}


variable "key_name" {
  description = "Desired name of Keypair..."
  default = "may"
}

variable "bootstrap_path" {
  description = "Script to install Docker Engine"
  default = "install_docker_machine_compose.sh"
}
