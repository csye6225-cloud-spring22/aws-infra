
resource "aws_cloudwatch_metric_alarm" "alarm_for_cpu_high" {
  alarm_name          = "alarm_for_cpu_high"
  alarm_description   = "Scale-up if CPU > 5% for 60 seconds"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  statistic           = "Average"
  period              = 60
  evaluation_periods  = 2
  threshold           = 5
  comparison_operator = "GreaterThanThreshold"
  alarm_actions       = [aws_autoscaling_policy.autoscaling_scaleUp.arn]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.autoScaling-group.name
  }
}

resource "aws_cloudwatch_metric_alarm" "alarm_for_cpu_low" {
  alarm_name          = "alarm_for_cpu_low"
  alarm_description   = "Scale-down if CPU < 3% for 60 seconds"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  statistic           = "Average"
  period              = 60
  evaluation_periods  = 2
  threshold           = 3
  comparison_operator = "LessThanThreshold"
  alarm_actions       = [aws_autoscaling_policy.autoscaling_scaleDown.arn]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.autoScaling-group.name
  }
}
