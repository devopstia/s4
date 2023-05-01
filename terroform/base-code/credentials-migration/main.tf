provider "aws" {
  region = "us-east-1"
}

variable "environment" {
  type    = string
  default = "dev"
}


data "aws_ssm_parameter" "db_password" {
  name = "/${var.environment}/db_password"
}

data "aws_ssm_parameter" "db_user" {
  name = "/${var.environment}/db_user"
}


resource "aws_db_instance" "mysql" {
  identifier = "demodb"

  engine            = "mysql"
  engine_version    = "5.7"
  instance_class    = "db.t2.micro"
  storage_type      = "standard"
  allocated_storage = 5

  name     = "demodb"
  username = data.aws_ssm_parameter.db_user.value
  password = data.aws_ssm_parameter.db_password.value
  port     = "3306"

  // This will take the RDS final snapshot when you destroy the RDS
  final_snapshot_identifier = "${var.environment}-mysql-final-snapshot"

  tags = {
    Name = "${var.environment}-mysql"
  }
}
