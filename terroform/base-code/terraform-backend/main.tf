resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket-name
  versioning {
    enabled = var.versioning_enable
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  object_lock_configuration {
    object_lock_enabled = "Enabled"
  }
  tags = {
    Name        = "S3 Remote Terraform State Store"
    Owner       = var.tags.Owner
    Project     = var.tags.Project
    Environment = var.tags.Environment
    Create_By   = var.tags.Create_By
  }
}
