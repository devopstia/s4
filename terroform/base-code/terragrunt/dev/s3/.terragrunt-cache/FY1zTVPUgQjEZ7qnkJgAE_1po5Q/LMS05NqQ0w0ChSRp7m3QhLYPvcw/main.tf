# terraform {
#   required_version = ">= 1.0.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 3.0"
#     }
#   }
# }

provider "aws" {
  region = var.aws_region # this a single line comment
}

resource "aws_s3_bucket" "b" {
  bucket = var.bucket_name

  tags = {
    Environment = "Dev"
  }
}
