resource "aws_route_table" "public1" {
  vpc_id = aws_vpc.main.id

  route {
    # cidr_block = "0.0.0.0/0"
    cidr_block = var.internetgateway_cidr
    gateway_id = aws_internet_gateway.internetGateway.id
  }

  tags = {
    Name = "A03 Terraform public_route_table"
  }
}

resource "aws_route_table" "private1" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "A03 Terraform private_route_table"
  }
}

#zone 1 public subnet
resource "aws_route_table_association" "public_z1" {
  depends_on = [
    aws_route_table.public1,
    aws_subnet.public_subnet_zone_1
  ]

  route_table_id = aws_route_table.public1.id
  subnet_id      = aws_subnet.public_subnet_zone_1.id
}

#zone 2 public subnet
resource "aws_route_table_association" "public_z2" {
  depends_on = [
    aws_route_table.public1,
    aws_subnet.public_subnet_zone_2
  ]

  route_table_id = aws_route_table.public1.id
  subnet_id      = aws_subnet.public_subnet_zone_2.id
}

#zone 3 public subnets
resource "aws_route_table_association" "public_z3" {
  depends_on = [
    aws_route_table.public1,
    aws_subnet.public_subnet_zone_2
  ]

  route_table_id = aws_route_table.public1.id
  subnet_id      = aws_subnet.public_subnet_zone_3.id
}


#zone 1 private subnets
resource "aws_route_table_association" "private_z1" {
  depends_on = [
    aws_route_table.private1,
    aws_subnet.private_subnet_zone_1
  ]

  route_table_id = aws_route_table.private1.id
  subnet_id      = aws_subnet.private_subnet_zone_1.id
}


#zone 2 private subnets
resource "aws_route_table_association" "private_z2" {
  depends_on = [
    aws_route_table.private1,
    aws_subnet.private_subnet_zone_2
  ]

  route_table_id = aws_route_table.private1.id
  subnet_id      = aws_subnet.private_subnet_zone_2.id
}

#zone 3 private subnets
resource "aws_route_table_association" "private_z3" {
  depends_on = [
    aws_route_table.private1,
    aws_subnet.private_subnet_zone_3
  ]

  route_table_id = aws_route_table.private1.id
  subnet_id      = aws_subnet.private_subnet_zone_3.id
}


