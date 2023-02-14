terraform {
  required_providers{
    aws ={
        source="hashicorp/aws"
        version=">=4.0"
    }
  }
}
provider "aws" {
    region=var.region
    profile =var.profile
}

# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"
# #   vpc_id     = aws_vpc.main.id
#   tags={
#     Name="trial"
#   }
# }
# # resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
# #   vpc_id     = aws_vpc.main.id
# #   cidr_block = "10.0.1.0/16"
# # }

# resource "aws_subnet" "subnet1" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = "10.0.1.0/24"
#   tags={
#     Name="subnet1"
#   }
# }


# resource "aws_subnet" "subnet2" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = "10.0.2.0/24"
#   tags={
#     Name="subnet2"

#   }
# }
# resource "aws_internet_gateway" "gateway1" {
#   vpc_id = aws_vpc.main.id
#   tags = {
#     Name = "gateway1"
#   }
# }
# resource "aws_route_table" "example" {
#   vpc_id = aws_vpc.main.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.gateway1.id
#   }

#   tags = {
#     Name = "route_table"
#   }
# }
# resource "aws_route_table" "example2" {
#   vpc_id = aws_vpc.main.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.gateway1.id
#   }

#   tags = {
#     Name = "route_table"
#   }
# }

# resource "aws_instance" "web" {
#   ami           = "ami-0aa7d40eeae50c9a9"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "HelloWorld"
#   }
# }