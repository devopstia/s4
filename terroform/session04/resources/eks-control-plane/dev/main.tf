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
    key            = "eks-control-plane/terraform.tfstate"
    region         = "us-east-1"
  }
}

locals {
  aws_region              = "us-east-1"
  control_plane_version   = "1.24"
  endpoint_private_access = false
  endpoint_public_access  = true

  common_tags = {
    "AssetID"       = "2526"
    "AssetName"     = "Insfrastructure"
    "Teams"         = "DEL"
    "Environment"   = "dev"
    "Project"       = "alpha"
    "CreateBy"      = "Terraform"
    "cloudProvider" = "aws"
  }

}

module "vpc" {
  source                  = "../../../modules/eks-control-plane"
  aws_region              = local.aws_region
  control_plane_version   = local.control_plane_version
  endpoint_private_access = local.endpoint_private_access
  endpoint_public_access  = local.endpoint_public_access
  common_tags             = local.common_tags
}
