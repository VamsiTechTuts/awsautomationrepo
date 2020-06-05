variable "cidr_vpc" {
  description = "CIDR block for the VPC"
  default = "10.1.0.0/16"
}
variable "cidr_subnet" {
  description = "CIDR block for the subnet"
  default = "10.1.0.0/24"
}
variable "availability_zone" {
  description = "availability zone to create subnet"
  default = "us-east-1a"
}
variable "key_name" {
  description = "key name"
  default = "may"
}
variable "instance_ami" {
  description = "AMI for aws EC2 instance"
  default = "ami-09d95fab7fff3776c"
}
variable "instance_type" {
  description = "type for aws EC2 instance"
  default = "t2.micro"
}
variable "environment_tag" {
  description = "Environment tag"
  default = "Dev"
}
variable "instance_name" {
  description = "Name of the instance"
  default = "Terraform_Instance"
}
