data "aws_availability_zones" "availableZone" {
  state = "available"
}
# data "aws_cloudwatch_log_group" "logGroup"{
#   name = "csye6225"
# }