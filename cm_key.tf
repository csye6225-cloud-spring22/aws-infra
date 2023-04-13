# resource "aws_kms_key" "ebsKey" {
#   description              = "Key created manually"
#   customer_master_key_spec = "SYMMETRIC_DEFAULT"
#   enable_key_rotation      = true
#   is_enabled               = true
# }

# resource "aws_kms_key" "rdsKey" {
#   description              = "Key for Database"
#   customer_master_key_spec = "SYMMETRIC_DEFAULT"
#   enable_key_rotation      = true
#   is_enabled               = true
# }
resource "aws_kms_key" "ebsKey" {
  description              = "Manually created key"
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
  #   enable_key_rotation      = true
  #   is_enabled               = true
  deletion_window_in_days = 7
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "Enable IAM User Permissions"
        Effect = "Allow"
        Principal = {
          AWS = "*"
        }
        Action = [
          "kms:*"
        ]
        Resource = "*"
      },
      {
        Sid    = "Enable EBS Encryption"
        Effect = "Allow"
        Principal = {
          AWS = "*"
        }
        Action = [
          "kms:Encrypt*",
          "kms:Decrypt*",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*",
          "kms:DescribeKey"
        ]
        Resource = "*"
      }
    ]
  })
}



resource "aws_kms_key" "rdsKey" {
  description              = "Database key"
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
  #   enable_key_rotation      = true
  #   is_enabled               = true
  deletion_window_in_days = 7
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "Enable IAM User Permissions"
        Effect = "Allow"
        Principal = {
          AWS = "*"
        }
        Action = [
          "kms:*"
        ]
        Resource = "*"
      },
      {
        Sid    = "Enable EBS Encryption"
        Effect = "Allow"
        Principal = {
          AWS = "*"
        }
        Action = [
          "kms:Encrypt*",
          "kms:Decrypt*",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*",
          "kms:DescribeKey"
        ]
        Resource = "*"
      }
    ]
  })
}
