resource "aws_instance" "webservers" {
    ami		= var.ami
    instance_type = var.instance_type
    count         = var.instance_count
    key_name	= var.key_name
    security_groups = ["${aws_security_group.websg.name}"]
    user_data	= file("install_httpd.sh")
    
    lifecycle {
        create_before_destroy = true
    }

    root_block_device {
        volume_type = "gp2"
        volume_size = "8"
    }

    tags = {
      Name = "elb-servers"
    }
}
