resource "aws_internet_gateway" "internetGateway" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "A03 interent gateway"
  }
}