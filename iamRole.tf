

resource "aws_iam_policy" "WebAppS3" { 

    depends_on = [
      aws_s3_bucket.buckets3
    ]

  name = "WebAppS3"

#   policy = "${file("s3-policy.json")}"
  policy = jsonencode(
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Action": [
                    "s3:PutObject",
                    "s3:GetObject",
                    "s3:DeleteObject"
                ],
                "Effect": "Allow",

                "Resource": [
                    "arn:aws:s3:::${aws_s3_bucket.buckets3.bucket}",
                    "arn:aws:s3:::${aws_s3_bucket.buckets3.bucket}/*"
                ]
            }
        ]
    }
  )

}

resource "aws_iam_role" "EC2-CSYE6225" {
  name = "EC2-CSYE6225"

      depends_on = [
      aws_s3_bucket.buckets3
    ]

  # assume_role_policy = file("s3-policy.json")

  assume_role_policy = <<EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
            }
        ]
    }
    EOF



  tags = {
    "Name" = "csye6225_ec2_role"
  }
}


resource "aws_iam_role_policy_attachment" "policy-attach" {
  role       = aws_iam_role.EC2-CSYE6225.name
  policy_arn = aws_iam_policy.WebAppS3.arn
}
