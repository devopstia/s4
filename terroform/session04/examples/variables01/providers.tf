provider "aws" {
  region = var.create_instance ? var.aws_region[0] : var.aws_region[1]
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
