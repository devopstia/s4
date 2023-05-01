resource "aws_dynamodb_table" "terraform-lock" {
  name           = var.dynamodb-table-name
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name        = "DynamoDB Terraform State Lock Table"
    Owner       = var.tags.Owner
    Project     = var.tags.Project
    Environment = var.tags.Environment
    Create_By   = var.tags.Create_By
  }
}
