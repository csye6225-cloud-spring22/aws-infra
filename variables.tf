variable "availabilityZones" {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  description = "Values for availablity zones"

}
variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
  type    = string
}
variable "internetgateway_cidr" {
  default = "0.0.0.0/0"
  type    = string
}
variable "profile" {
  default = "dev"
  type    = string
}
variable "vpc_tag" {
  default = "A03"
  type    = string
}
variable "region" {
  default = "us-east-1"
  type    = string
}
variable "subnet_public_cidr_zone1" {
  default = "10.0.1.0/24"
  type    = string
}
variable "subnet_public_cidr_zone2" {
  default = "10.0.2.0/24"
  type    = string
}
variable "subnet_public_cidr_zone3" {
  default = "10.0.3.0/24"
  type    = string
}
variable "subnet_private_cidr_zone1" {
  default = "10.0.4.0/24"
  type    = string
}
variable "subnet_private_cidr_zone2" {
  default = "10.0.5.0/24"
  type    = string
}
variable "subnet_private_cidr_zone3" {
  default = "10.0.6.0/24"
  type    = string
}

#making it here

variable "instanceType" {
  default = "t2.micro"
  type    = string
}
variable "volumeSize" {
  default = 50
  type    = number
}
variable "volumeType" {
  default = "gp2"
  type    = string
}
variable "owner_id" {
  default = ["460413207367"]
  type    = list(string)
}

#s3 bucket
variable "bucketname" {
  default = "csye6225-s3-product-image"
  type    = string
}
variable "days" {
  default = 30
  type    = number
}
variable "bucket_prefix" {
  default = "csye6225-s3"
  type    = string
}
variable "storage_class" {
  default = "STANDARD_IA"
  type    = string
}
variable "sse_algorithm" {
  default = "STANDARD_IA"
  type    = string
}

#rds
variable "allocated_storage" {
  default = 10
  type    = number
}
variable "db_name" {
  default = "csye6225"
  type    = string
}
variable "engine" {
  default = "mysql"
  type    = string
}
variable "identifier" {
  default = "csye6225"
  type    = string
}
variable "username" {
  default = "csye6225"
  type    = string
}
variable "instance_class" {
  default = "db.t3.micro"
  type    = string
}
variable "storage_type" {
  default = "gp2"
  type    = string
}
variable "password" {
  type    = string
}
variable "engine_version" {
  default = "5.7"
  type    = string
}
#cidr_port
variable "vpc_cidr_block_22" {
  default = ["0.0.0.0/0"]
  type    = list(string)
}
variable "vpc_cidr_block_80" {
  default = ["0.0.0.0/0"]
  type    = list(string)
}
variable "vpc_cidr_block_443" {
  default = ["0.0.0.0/0"]
  type    = list(string)
}
variable "egress_cidr_1" {
  default = ["0.0.0.0/0"]
  type    = list(string)
}
variable "egress_cidr_2" {
  default = ["0.0.0.0/0"]
  type    = list(string)
}

#route53
variable "record_name" {
  default = "dev.namrataruchandani.me"
  type    = string
}
variable "zone_id" {
  default = "Z086454422QS54M8Z4PMR"
  type    = string
}



