resource "aws_lb_target_group" "target_grp_alb" {
  name     = "target-grp-alb"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
  # target_type = "instance"

  health_check {
    enabled  = true
    path     = "/healthz"
    port     = 80
    interval = 300
    protocol = "HTTP"
    #   # timeout   = 5
    # healthy_threshold   = 5
    # unhealthy_threshold = 3

  }
}