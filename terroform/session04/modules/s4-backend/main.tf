
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "tf_course" {

  bucket = format("%s-%s-%s-state", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-state", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
    },
  )
}


resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name           = format("%s-%s-%s-state-lock", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}
