terraform {
  backend "s3" {
    bucket = "terraform-test-class2022"
    key    = "development/ec2-instances/terraform.tfstate"
    region = "us-east-1"
  }
}
