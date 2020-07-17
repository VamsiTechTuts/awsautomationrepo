resource "aws_autoscaling_schedule" "scaleup_cron" {
  scheduled_action_name  = "start_cron_example"
  min_size               = 2
  max_size               = 4
  desired_capacity       = 4
  start_time             = var.scaleup_start_time
  end_time               = var.scaleup_end_time
  recurrence             = var.scaleup_recurrence
  autoscaling_group_name = aws_autoscaling_group.agents.name
}

resource "aws_autoscaling_schedule" "scaledown_cron" {
  scheduled_action_name  = "stop_cron_example"
  min_size               = 2
  max_size               = 4
  desired_capacity       = 2
  start_time             = var.scaledown_start_time
  end_time               = var.scaledown_end_time
  recurrence             = var.scaledown_recurrence
  autoscaling_group_name = aws_autoscaling_group.agents.name
}

