resource "aws_security_group" "a04security" {
  name        = " application"
  description = "Here is the terraform security group for a04"
  vpc_id      = aws_vpc.main.id

  ingress {
    cidr_blocks = var.vpc_cidr_block_22
    description = "giving access for SSH"
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }

  ingress {
    cidr_blocks = var.vpc_cidr_block_80
    description = "giving access for HTTP"
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }
  ingress {
    cidr_blocks = var.vpc_cidr_block_443
    description = "giving access for HTTPS"
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
  }

  egress {
    cidr_blocks      = var.egress_cidr_1
    from_port        = 0
    protocol         = "-1"
    to_port          = 0
    ipv6_cidr_blocks = ["::/0"]
  }

}
resource "aws_security_group" "database_access" {

  name = "Database Access Security Group"

  description = "Used for database access"

  vpc_id = aws_vpc.main.id

  # ingress.0.protocol = 
  ingress {
    description = "Access To Database"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    # cidr_blocks = ["0.0.0.0/0"]
    security_groups = [aws_security_group.a04security.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.egress_cidr_2
    ipv6_cidr_blocks = ["::/0"]
  }
}