resource "aws_subnet" "public_subnet_zone_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_public_cidr_zone1
  availability_zone =data.aws_availability_zones.availableZone.names[0]

  tags={
    Name="A03 terraform public_subnet_zone_1"
  }
}


resource "aws_subnet" "public_subnet_zone_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_public_cidr_zone2
  availability_zone = data.aws_availability_zones.availableZone.names[1]

  tags={
    Name="A03 terraform public_subnet_zone_2"
  }
}


resource "aws_subnet" "public_subnet_zone_3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_public_cidr_zone3
  availability_zone =data.aws_availability_zones.availableZone.names[2]

  tags={
    Name="A03 terraform public_subnet_zone_3"
  }
}
