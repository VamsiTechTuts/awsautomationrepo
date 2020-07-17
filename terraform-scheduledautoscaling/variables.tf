variable "ami" {
  description = "AMI Instance ID"
  default = "ami-08f3d892de259504d"
}

variable "instance_type" {
  description = "Type of instance"
  default = "t2.micro"
}

variable "key_name" {
  description = "key name for the instance"
  default = "helloworld"
}

variable "scaleup_start_time" {
  description = "start time for scheduling autoscaling"
  default = "2020-07-17T12:10:00Z"
}

variable "scaleup_end_time" {
  description = "end time for scheduling autoscaling"
  default = "2020-07-18T12:15:00Z"
}

variable "scaleup_recurrence" {
  description = "recurrence for scheduling autoscaling"
  default = "10 12 * * *"
}

variable "scaledown_start_time" {
  description = "start time for scheduling autoscaling"
  default = "2020-07-17T12:10:00Z"
}

variable "scaledown_end_time" {
  description = "end time for scheduling autoscaling"
  default = "2020-07-18T12:15:00Z"
}

variable "scaledown_recurrence" {
  description = "recurrence for scheduling autoscaling"
  default = "10 12 * * *"
}

