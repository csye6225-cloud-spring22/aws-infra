data "aws_acm_certificate" "aws_certificate" {
    domain = var.record_name
    statuses = [ "ISSUED" ]
    most_recent = true
}