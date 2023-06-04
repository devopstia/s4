terraform {
  backend "s3" {
    bucket         = "2560-dev-alpha-s3-backend"
    key            = "openid-alpha/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "2560-dev-alpha-s3-dynamodb-table"
  }
}
