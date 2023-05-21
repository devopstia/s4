terraform {
  source = "../../../modules//postgres/"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "${get_terragrunt_dir()}/../vpc", 
    "${get_terragrunt_dir()}/../bastion-host",
     "${get_terragrunt_dir()}/../secret-manager",
    ]
}

inputs = {
  common_tags = {
    "AssetID"       = "2560"
    "AssetName"     = "Insfrastructure"
    "Teams"         = "DEL"
    "Environment"   = "dev"
    "Project"       = "alpha"
    "CreateBy"      = "Terraform"
    "cloudProvider" = "aws"
  }

  postgres = {
    engine                      = "postgres"
    engine_version              = "13.4"
    instance_class              = "db.t3.small"
    allocated_storage           = 20
    max_allocated_storage       = 100
    publicly_accessible         = false
    name                        = "artifactory"
    final_snapshot_identifier   = "alpha-db-snapshot"
    skip_final_snapshot         = false
    backup_retention_period     = 7
    deletion_protection         = true
    maintenance_window          = "Sun:03:00-Sun:04:00"
    multi_az                    = false
    allow_major_version_upgrade = false
    auto_minor_version_upgrade  = true
    family                      = "postgres13"
    zone_id                     = "Z09063052B43KCQ7FSGHY"
    aws_route53_record          = "artifactory"
  }
}
