
resource "aws_autoscaling_group" "autoScaling-group" {

  desired_capacity = var.desired_capacity

  max_size = var.max_size

  min_size = var.min_size

  launch_template {
    id = aws_launch_template.launchTemplate.id
  }

  default_cooldown = var.cooldown_period

  force_delete = true

  target_group_arns = [aws_lb_target_group.target_grp_alb.arn]

  vpc_zone_identifier = [
    aws_subnet.public_subnet_zone_1.id,
    aws_subnet.public_subnet_zone_2.id,
    aws_subnet.public_subnet_zone_3.id
  ]

  #   load_balancers = [
  #     aws_lb.load_balancer.id
  #   ]

  tag {
    key                 = "Name"
    value               = "cloud_app"
    propagate_at_launch = true
  }
}
# scale up policy
resource "aws_autoscaling_policy" "autoscaling_scaleUp" {
  name                   = "autoscaling_scaleUp"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 30
  autoscaling_group_name = aws_autoscaling_group.autoScaling-group.name
  policy_type            = "SimpleScaling"
}

# scale down policy
resource "aws_autoscaling_policy" "autoscaling_scaleDown" {
  name                   = "autoscaling_scaleDown"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 30
  autoscaling_group_name = aws_autoscaling_group.autoScaling-group.name
  policy_type            = "SimpleScaling"
}


resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = aws_autoscaling_group.autoScaling-group.id
  lb_target_group_arn    = aws_lb_target_group.target_grp_alb.arn
}
