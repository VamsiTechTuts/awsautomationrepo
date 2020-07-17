resource "aws_launch_configuration" "agent-lc" {
    name_prefix = "agent-lc-"
    image_id = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    security_groups = ["${aws_security_group.websg.id}"]
    user_data = file("install_httpd.sh")
    
    lifecycle {
        create_before_destroy = true
    }

    root_block_device {
        volume_type = "gp2"
        volume_size = "8"
    }
}
