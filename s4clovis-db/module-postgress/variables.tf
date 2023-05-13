variable "identifier" {
  type    = string
  default = "example-postgres-db"
}

variable "engine" {
  type    = string
  default = "postgres"
}

variable "engine_version" {
  type    = string
  default = "13.4"
}

variable "instance_class" {
  type    = string
  default = "db.t3.small"
}

variable "allocated_storage" {
  type    = string
  default = "20"
}

variable "max_allocated_storage" {
  type    = string
  default = "100"
}

variable "publicly_accessible" {
  type    = string
  default = "false"
}

variable "name" {
  type    = string
  default = "artifactory"
}

variable "username" {
  type    = string
  default = "exampleuser"
}

variable "password" {
  type    = string
  default = "examplepassword"
}

variable "skip_final_snapshot" {
  type    = string
  default = "true"
}

variable "backup_retention_period" {
  type    = string
  default = "7"
}

variable "deletion_protection" {
  type    = string
  default = "false"
}

variable "multi_az" {
  type    = string
  default = "false"
}

variable "allow_major_version_upgrade" {
  type    = string
  default = "false"
}

variable "auto_minor_version_upgrade" {
  type    = string
  default = "true"
}

#############
variable "security_group_name_prefix" {
  type    = string
  default = "example-postgres-db-"
}

variable "security_group_vpc_id" {
  type    = string
  default = "vpc-0ee701990ff30ec3a"
}

########
variable "aws_db_subnet_name" {
  type    = string
  default = "example-postgres-subnet"
}

variable "aws_db_subnet_ids" {
  type    = list(any)
  default = ["subnet-0e7c5796d8110b510", "subnet-01b6648a034a59d6d"]
}

########
variable "aws_db_parameter_name" {
  type    = string
  default = "default-postgres12"
}

variable "aws_db_parameter_family" {
  type    = string
  default = "postgres13"
}

