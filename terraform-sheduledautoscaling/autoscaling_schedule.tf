resource "aws_autoscaling_schedule" "start_cron_example" {
  scheduled_action_name  = "start_cron_example"
  min_size               = 2
  max_size               = 4
  desired_capacity       = 2
  start_time             = "2020-07-17T11:10:00Z"
  end_time               = "2020-07-18T11:25:00Z"
  recurrence             = "10 11 * * *"
  autoscaling_group_name = aws_autoscaling_group.agents.name
}

resource "aws_autoscaling_schedule" "stop_cron_example" {
  scheduled_action_name  = "stop_cron_example"
  min_size               = 2
  max_size               = 4
  desired_capacity       = 2
  start_time             = "2020-07-17T11:26:00Z"
  end_time               = "2020-07-18T11:35:00Z"
  recurrence             = "26 11 * * *"
  autoscaling_group_name = aws_autoscaling_group.agents.name
}

