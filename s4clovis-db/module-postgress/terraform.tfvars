identifier                  = "example-postgres-db"
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
############################################
security_group_name_prefix = "example-postgres-db-"
security_group_vpc_id      = "vpc-0ee701990ff30ec3a"
############################################
aws_db_subnet_name = "example-postgres-subnet"
aws_db_subnet_ids = ["subnet-0e7c5796d8110b510",
"subnet-01b6648a034a59d6d"]
############################################
aws_db_parameter_name   = "default-postgres12"
aws_db_parameter_family = "postgres13"
