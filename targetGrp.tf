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
# resource "aws_lb_target_group" "target_grp_alb" {
#   name        = "target-grp-alb"
#   port        = 80
#   protocol    = "HTTP"
#   vpc_id      = aws_vpc.main.id
#   target_type = "instance"
#   # health_check {
#   #   enabled = false
#   #   path     = "/healthz"

#   #   port     = 80

#   #   interval = 10

#   # }
#   health_check {
#     enabled   = true
#     interval  = 30
#     path      = "/"
#     port      = "traffic-port"
#     protocol  = "HTTP"
#     timeout   = 5
#     healthy_threshold   = 3
#     unhealthy_threshold = 3
#   }
# }

# resource "aws_lb_target_group_attachment" "attachment_first" {
#   target_group_arn = aws_lb_target_group.target_grp_alb.arn
#   target_id        = aws_instance.instance-webapp.id
#   port             = 80
# }