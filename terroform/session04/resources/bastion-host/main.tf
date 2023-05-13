provider "aws" {
  region = local.aws_region
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
    key            = "bastion-host/terraform.tfstate"
    region         = "us-east-1"
  }
}

locals {
  aws_region    = "us-east-1"
  ami           = "ami-0eb5c571bf15422ac"
  instance_type = "t2.micro"
  key_name      = "s4"
  common_tags = {
    "AssetID"       = "2560"
    "AssetName"     = "Insfrastructure"
    "Teams"         = "DEL"
    "Environment"   = "dev"
    "Project"       = "alpha"
    "CreateBy"      = "Terraform"
    "cloudProvider" = "aws"
  }
}

module "bastion-host" {
  source        = "../../modules/bastion-host"
  aws_region    = local.aws_region
  ami           = local.ami
  instance_type = local.instance_type
  key_name      = local.key_name
  common_tags   = local.common_tags
}
