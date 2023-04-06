data "aws_route53_zone" "zone_choosing" {
  name = var.record_name
}
resource "aws_route53_record" "my_route53" {
  # depends_on = [
  #   aws_instance.instance-webapp
  # ]
  name    = var.record_name
  zone_id = data.aws_route53_zone.zone_choosing.zone_id

  type = "A"
  # ttl = 60
  # records = [aws_instance.instance-webapp.public_ip]
  alias {
    name                   = aws_lb.application_lb.dns_name
    zone_id                = aws_lb.application_lb.zone_id
    evaluate_target_health = true
  }
}