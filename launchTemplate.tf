resource "aws_launch_template" "launchTemplate" {

  name = "launch-template-CSYE6225"
  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size = var.template_volume
    }

  }

  image_id = data.aws_ami.ami_latest.id

  instance_type = var.instanceType

  vpc_security_group_ids = [aws_security_group.a04security.id]

  # iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  iam_instance_profile {
    arn = aws_iam_instance_profile.iam-profile.arn
  }

  user_data = base64encode(templatefile("./autoScaling_launchTemplate.sh",
    {
      DB_DATABASE     = aws_db_instance.mydb.db_name,
      DB_USERNAME     = aws_db_instance.mydb.username,
      DB_PASSWORD     = aws_db_instance.mydb.password,
      DB_HOST         = aws_db_instance.mydb.address,
      AWS_Bucket_name = aws_s3_bucket.buckets3.bucket
    }


  ))
}