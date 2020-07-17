resource "aws_autoscaling_policy" "agents-scale-up" {
    name = "agents-scale-up"
    scaling_adjustment = 1
    adjustment_type = "ChangeInCapacity"
    cooldown = 300
    autoscaling_group_name = aws_autoscaling_group.agents.name
}

resource "aws_autoscaling_policy" "agents-scale-down" {
    name = "agents-scale-down"
    scaling_adjustment = -1
    adjustment_type = "ChangeInCapacity"
    cooldown = 300
    autoscaling_group_name = aws_autoscaling_group.agents.name
}
