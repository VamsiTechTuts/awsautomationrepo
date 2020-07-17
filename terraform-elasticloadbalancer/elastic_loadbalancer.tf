resource "aws_elb" "elb1" {
  name = "terraform-elb"
  cross_zone_load_balancing = true
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400
  security_groups = ["${aws_security_group.websg.id}"]
  availability_zones = aws_instance.webservers[*].availability_zone
  instances = aws_instance.webservers.*.id

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
	healthy_threshold = 2
	unhealthy_threshold = 2
	timeout = 3
	target = "HTTP:80/"
	interval = 30
  }

  tags = {
	Name = "terraform-elb"
  }

}

resource "aws_lb_cookie_stickiness_policy" "cookie_stickness" {
  name = "cookiestickness"
  load_balancer = aws_elb.elb1.id
  lb_port = 80
  cookie_expiration_period = 600
}

output "elb-dns" {
  value = "${aws_elb.elb1.dns_name}"
}
