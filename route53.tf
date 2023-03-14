data "aws_route53_zone" "zone_choosing" {
  name = var.record_name
}
resource "aws_route53_record" "my_route53" {
    depends_on = [
      aws_instance.instance-webapp
    ]
    name = var.record_name
    zone_id = data.aws_route53_zone.zone_choosing.zone_id
    # zone_id = var.zone_id
    type = "A"
    ttl = 60
    records = [aws_instance.instance-webapp.public_ip]
}
