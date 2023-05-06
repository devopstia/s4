provider "aws" {
  region = "us-east-1"
}

# terraform blocks

terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket         = "2560-dev-s4-state"
    dynamodb_table = "2560-dev-s4-state-lock"
    key            = "test/dev/terraform.tfstate"
    region         = "us-east-1"
  }
}


# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "my_vpc"
  }
}
