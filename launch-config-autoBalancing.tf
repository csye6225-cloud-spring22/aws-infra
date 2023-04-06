# resource "aws_launch_configuration" "autoScaling_launch_config" {

#   name = "auto_scaling_group_launch_configuration"

#   instance_type = "t2.micro"

#   image_id = data.aws_ami.ami_latest.id

#   associate_public_ip_address = true


#   security_groups = [aws_security_group.a04security.id]


#   iam_instance_profile = aws_iam_instance_profile.iam-profile.name

#   user_data = <<EOF
#     #!/bin/bash
#     cd /home/ec2-user
#     touch .env
#       echo DB_DATABASE="${aws_db_instance.mydb.db_name}" >> .env
#   echo DB_USERNAME="${aws_db_instance.mydb.username}" >> .env
#   echo DB_PASSWORD="${aws_db_instance.mydb.password}" >> .env
#   echo DB_HOST="${aws_db_instance.mydb.address}" >> .env

#     echo AWS_Bucket_name="${aws_s3_bucket.buckets3.bucket}" >> .env
#     echo NODE_ENV="production" >> .env  
#     echo PORT="8000" >> .env

#     sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
#         -a fetch-config \
#         -m ec2 \
#         -c file:/home/ec2-user/cloud-watch-config.json \
#         -s

#     sudo systemctl daemon-reload
#     sudo systemctl enable nginx
#     sudo systemctl start nginx
#     sudo systemctl enable webapp
#     sudo systemctl start webapp



#     EOF

# }
