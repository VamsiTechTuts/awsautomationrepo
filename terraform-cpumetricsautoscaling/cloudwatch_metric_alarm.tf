resource "aws_cloudwatch_metric_alarm" "cpu-high" {
    alarm_name = "cpu-utilization-high"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods = "2"
    metric_name = "CPUUtilization"
    namespace = "AWS/EC2"
    period = "60"
    statistic = "Average"
    threshold = "40"
    alarm_description = "This metric monitors ec2 cpu for high utilization on agent hosts"
    alarm_actions = [
        aws_autoscaling_policy.agents-scale-up.arn
    ]
    dimensions = {
        AutoScalingGroupName = aws_autoscaling_group.agents.name
    }
}

resource "aws_cloudwatch_metric_alarm" "cpu-low" {
    alarm_name = "cpu-utilization-low"
    comparison_operator = "LessThanOrEqualToThreshold"
    evaluation_periods = "2"
    metric_name = "CPUUtilization"
    namespace = "AWS/EC2"
    period = "60"
    statistic = "Average"
    threshold = "20"
    alarm_description = "This metric monitors ec2 cpu for low utilization on agent hosts"
    alarm_actions = [
        aws_autoscaling_policy.agents-scale-down.arn
    ]
    dimensions = {
        AutoScalingGroupName = aws_autoscaling_group.agents.name
    }
}
