variable "postgres" {
  type = map(any)
  default = {
    aws_region                  = "us-east-1"
    identifier                  = "example-postgres-db"
    engine                      = "postgres"
    engine_version              = "13.4"
    instance_class              = "db.t3.small"
    allocated_storage           = 20
    max_allocated_storage       = 100
    publicly_accessible         = false
    name                        = "artifactory"
    skip_final_snapshot         = true
    backup_retention_period     = 7
    deletion_protection         = false
    maintenance_window          = "Sun:03:00-Sun:04:00"
    multi_az                    = false
    allow_major_version_upgrade = false
    auto_minor_version_upgrade  = true
    family                      = "postgres13"
    zone_id                     = "Z09063052B43KCQ7FSGHY"
    route53-record              = "artifactory"
  }
}

variable "common_tags" {
  type = map(any)
  default = {
    "AssetID"       = "2560"
    "AssetName"     = "Insfrastructure"
    "Teams"         = "DEL"
    "Environment"   = "dev"
    "Project"       = "alpha"
    "CreateBy"      = "Terraform"
    "cloudProvider" = "aws"
  }
}
