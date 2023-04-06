resource "aws_s3_bucket" "buckets3" {
  bucket_prefix = var.bucket_prefix
  force_destroy = true
  tags = {
    Name = "S3-bucket-images"
  }

}


resource "aws_s3_bucket_lifecycle_configuration" "my_lifecycle_configuration" {
  bucket = aws_s3_bucket.buckets3.id
  rule {
    id = "image"
    transition {
      days          = var.days
      storage_class = var.storage_class
    }
    status = "Enabled"
  }
}


resource "aws_s3_bucket_server_side_encryption_configuration" "encryption_resource" {
  bucket = aws_s3_bucket.buckets3.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.sse_algorithm
    }
  }
}
resource "aws_s3_bucket_public_access_block" "blocking_public_access" {
  bucket = aws_s3_bucket.buckets3.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
# aws s3 rm s3://s3-csye-6225-product-image --recursive --profile dev

