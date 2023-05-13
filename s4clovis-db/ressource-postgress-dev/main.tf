# provider blocks
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

# backend blocks
terraform {
  backend "s3" {
    bucket         = "2560-clovis-s4-state"
    dynamodb_table = "2560-clovis-s4-state-lock"
    key            = "database/postgress-module/terraform.tfstate"
    region         = "us-east-1"
  }
}

###################### locals ############################
locals {
  identifier                  = "dev-postgres-db"
  engine                      = "postgres"
  engine_version              = "13.4"
  instance_class              = "db.t3.small"
  allocated_storage           = 20
  max_allocated_storage       = 100
  publicly_accessible         = false
  name                        = "artifactory"
  username                    = "exampleuser"
  password                    = "examplepassword"
  skip_final_snapshot         = true
  backup_retention_period     = 7
  deletion_protection         = false
  multi_az                    = false
  allow_major_version_upgrade = false
  auto_minor_version_upgrade  = true
}
###################### module ############################
module "database" {
  source                      = "../module-postgress"
  identifier                  = local.identifier
  engine                      = local.engine
  engine_version              = local.engine_version
  instance_class              = local.instance_class
  allocated_storage           = local.allocated_storage
  max_allocated_storage       = local.max_allocated_storage
  publicly_accessible         = local.publicly_accessible
  name                        = local.name
  username                    = local.username
  password                    = local.password
  skip_final_snapshot         = local.skip_final_snapshot
  backup_retention_period     = local.backup_retention_period
  deletion_protection         = local.deletion_protection
  multi_az                    = local.multi_az
  allow_major_version_upgrade = local.allow_major_version_upgrade
  auto_minor_version_upgrade  = local.auto_minor_version_upgrade
}
