#provider block
provider "aws" {
  region = var.aws_region
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

## backend block
terraform {
  backend "s3" {
    bucket         = "2560-dev-s4-state"
    dynamodb_table = "2560-dev-s4-state-lock"
    key            = "vpc/dev-alpha-vpc/terraform.tfstate"
    region         = "us-east-1"
  }
}

# module block
module "vpc" {
  source             = "../../modules/vpc-module-s4-pure"
  vpc_cidr_block     = var.vpc_cidr_block
  aws_region         = var.aws_region
  subnets_cidr_block = var.subnets_cidr_block
  availability_zone  = var.availability_zone
  common_tags        = var.common_tags
}
