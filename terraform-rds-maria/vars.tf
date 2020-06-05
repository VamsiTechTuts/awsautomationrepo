variable "AWS_REGION" {
  default = "us-east-1"
}
variable "key_name" {
  default = "may"
}

variable "AMIS" {
  default = {
    us-east-1 = "ami-09d95fab7fff3776c"
  }
}
variable "RDS_PASSWORD" {
  default="Test#123"
}
