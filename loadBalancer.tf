resource "aws_lb" "application_lb" {
  name               = "application-loadbalancer"
  internal           = false
  load_balancer_type = "application"

  subnets         = [aws_subnet.public_subnet_zone_1.id, aws_subnet.public_subnet_zone_2.id, aws_subnet.public_subnet_zone_3.id]
  security_groups = [aws_security_group.lb_security_grp.id]
}
# resource "aws_lb_listener" "http" {
#   load_balancer_arn = aws_lb.application_lb.arn
#   port              = "80"
#   protocol          = "HTTP"
#   default_action {
#     type = "forward"
#     forward {
#       target_group {
#         arn = aws_lb_target_group.target_grp_alb.arn
#       }
#       stickiness {
#         enabled  = true
#         duration = 28800
#       }
#     }
#   }
# }
resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.application_lb.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn = data.aws_acm_certificate.aws_certificate.arn
  default_action {
    type = "forward"
    forward {
      target_group {
        arn = aws_lb_target_group.target_grp_alb.arn
      }
      stickiness {
        enabled  = true
        duration = 28800
      }
    }
  }
}