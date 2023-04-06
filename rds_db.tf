resource "aws_db_parameter_group" "db_paramter" {
  name   = "mysql-rds-pg"
  family = "mysql5.7"
}
resource "aws_db_subnet_group" "privateSubnet_group" {

  name       = "db_subnet_group"
  subnet_ids = [aws_subnet.private_subnet_zone_2.id, aws_subnet.private_subnet_zone_1.id]
  tags = {
    Name = "My Database Subnet Group"
  }
}
resource "aws_db_instance" "mydb" {
  parameter_group_name = aws_db_parameter_group.db_paramter.name
  allocated_storage    = 10
  db_name              = var.db_name
  engine               = var.engine
  engine_version       = var.engine_version
  identifier           = var.identifier
  instance_class       = var.instance_class
  username             = var.username
  password             = var.password
  storage_type         = var.storage_type
  storage_encrypted    = true
  skip_final_snapshot  = true

  db_subnet_group_name = aws_db_subnet_group.privateSubnet_group.name

  vpc_security_group_ids = [aws_security_group.database_access.id]
}

