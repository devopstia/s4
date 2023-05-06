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
    key            = "vpc/qa-beta-vpc/terraform.tfstate"
    region         = "us-east-1"
  }
}

locals {
  vpc_cidr_block = "10.0.0.0/16"
  aws_region     = "us-east-2"

  subnets_cidr_block = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
    "10.0.4.0/24",
    "10.0.5.0/24",
    "10.0.6.0/24"
  ]

  availability_zone = [
    "us-east-2a",
    "us-east-2b",
  ]

  common_tags = {
    "AssetID"       = "2560"
    "AssetName"     = "Insfrastructure"
    "Teams"         = "DEL"
    "Environment"   = "qa"
    "Project"       = "beta"
    "CreateBy"      = "Terraform"
    "cloudProvider" = "aws"
  }
}

module "vpc" {
  source             = "../../../modules/vpc-module-s4-pure"
  vpc_cidr_block     = local.vpc_cidr_block
  aws_region         = local.aws_region
  subnets_cidr_block = local.subnets_cidr_block
  availability_zone  = local.availability_zone
  common_tags        = local.common_tags
}
