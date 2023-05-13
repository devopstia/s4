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

variable "postgres" {
  type = map(any)
  default = {
    engine                      = "postgres"
    engine_version              = "13.4"
    instance_class              = "db.t3.small"
    allocated_storage           = 20
    max_allocated_storage       = 100
    publicly_accessible         = false
    name                        = "artifactory"
    username                    = "exampleuser"
    password                    = "examplepassword"
    final_snapshot_identifier   = "alpha-db-snapshot"
    skip_final_snapshot         = false
    parameter_group_name        = aws_db_parameter_group.postgres.name
    backup_retention_period     = 7
    deletion_protection         = false
    maintenance_window          = "Sun:03:00-Sun:04:00"
    multi_az                    = false
    allow_major_version_upgrade = false
    auto_minor_version_upgrade  = true
    family                      = "postgres13"
  }
}
