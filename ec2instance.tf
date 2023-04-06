data "aws_ami" "ami_latest" {
  # owners      = ["460413207367"]
  #   owners      = [var.owner_id]
  owners      = var.owner_id
  most_recent = true
}
# resource "aws_instance" "instance-webapp" {

#   depends_on = [
#     aws_db_instance.mydb
#   ]

#   ami = data.aws_ami.ami_latest.id

#   instance_type = var.instanceType

#   root_block_device {
#     delete_on_termination = true
#     volume_size           = var.volumeSize
#     volume_type           = var.volumeType
#   }
#   disable_api_termination = false


#   vpc_security_group_ids = [aws_security_group.a04security.id]



#   subnet_id = aws_subnet.public_subnet_zone_1.id

#   iam_instance_profile = aws_iam_instance_profile.iam-profile.name

#   user_data = <<EOF
#   #!/bin/bash
#   cd /home/ec2-user
#   touch .env
#   echo DB_DATABASE="${aws_db_instance.mydb.db_name}" >> .env
#   echo DB_USERNAME="${aws_db_instance.mydb.username}" >> .env
#   echo DB_PASSWORD="${aws_db_instance.mydb.password}" >> .env
#   echo DB_HOST="${aws_db_instance.mydb.address}" >> .env
#   echo AWS_Bucket_name="${aws_s3_bucket.buckets3.bucket}" >> .env
#   echo PORT="8000" >> .env

#   sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
#     -a fetch-config \
#     -m ec2 \
#     -c file:/home/ec2-user/cw_log.json \
#     -s


#   sudo systemctl daemon-reload
#   sudo systemctl enable nginx
#   sudo systemctl start nginx
#   sudo systemctl enable webapp
#   sudo systemctl start webapp

#   EOF
#   tags ={
#     Name = "A05-instance"
#   }

# }

# resource "aws_instance" "my-test-instance" {
# #   ami             = "${lookup(var.AmiLinux, var.region)}"
#     ami = "ami-006dcf34c09e50022"
#   instance_type   = "t2.micro"
#   iam_instance_profile = "${aws_iam_instance_profile.EC2-CSYE6225.name}"

#   tags {
#     Name = "test-instance"
#   }
# }

resource "aws_iam_instance_profile" "iam-profile" {
  name = "iam-profile"
  role = aws_iam_role.EC2-CSYE6225.name
}

