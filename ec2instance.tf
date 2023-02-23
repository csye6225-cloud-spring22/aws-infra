data "aws_ami" "ami_latest" {
    # owners      = ["460413207367"]
#   owners      = [var.owner_id]
owners = var.owner_id
  most_recent = true
}

resource "aws_instance" "instance-webapp" {
  ami           = data.aws_ami.ami_latest.id
  instance_type = var.instanceType
  root_block_device {
    delete_on_termination = true
    volume_size           = var.volumeSize
    volume_type           = var.volumeType
  }
  disable_api_termination = false

  vpc_security_group_ids = [aws_security_group.a04security.id]
  subnet_id              = aws_subnet.public_subnet_zone_1.id

  user_data = file("userData.sh")
}