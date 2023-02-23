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

