variable "s3_bucket_prefix" {
  type        = string
  description = "Prefix of the S3 bucket"
  default     = "my-bucket12547"
}

variable "s3_tags" {
  type = map(any)

  default = {
    created_by  = "Terraform"
    environment = "test"
    project     = "MAM"
  }
}

variable "s3_region" {
  type    = list(any)
  default = ["us-east-1", "us-east-2"]
}



provider "aws" {
  region = var.s3_region[0]
}

resource "aws_s3_bucket" "bucket1" {
  bucket = var.s3_bucket_prefix

  tags = {
    env          = lookup(var.s3_tags, "environment")
    project_name = lookup(var.s3_tags, "project")
    region       = var.s3_region[0]
  }
}
