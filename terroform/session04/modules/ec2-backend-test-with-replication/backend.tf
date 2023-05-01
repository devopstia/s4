terraform {
  backend "s3" {
    bucket         = "development-alpha-tf-state"
    dynamodb_table = "development-alpha-tf-state-lock"
    key            = "state-test/s4/terraform.tfstate"
    region         = "us-east-1"
  }
}
