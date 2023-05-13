####################################################################
resource "aws_db_instance" "postgres" {
  identifier                  = var.identifier
  engine                      = var.engine
  engine_version              = var.engine_version
  instance_class              = var.instance_class
  allocated_storage           = var.allocated_storage
  max_allocated_storage       = var.max_allocated_storage
  publicly_accessible         = var.publicly_accessible
  name                        = var.name
  username                    = var.username
  password                    = var.password
  skip_final_snapshot         = var.skip_final_snapshot
  backup_retention_period     = var.backup_retention_period
  deletion_protection         = var.deletion_protection
  multi_az                    = var.multi_az
  allow_major_version_upgrade = var.allow_major_version_upgrade
  auto_minor_version_upgrade  = var.auto_minor_version_upgrade
  parameter_group_name        = aws_db_parameter_group.postgres.name
  vpc_security_group_ids      = [aws_security_group.postgres.id]
  db_subnet_group_name        = aws_db_subnet_group.postgres.name
}

####################################################################
resource "aws_security_group" "postgres" {
  name_prefix = var.security_group_name_prefix
  vpc_id      = var.security_group_vpc_id
}

####################################################################
resource "aws_security_group_rule" "postgres_ingress" {
  type        = "ingress"
  from_port   = 5432
  to_port     = 5432
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.postgres.id
}

####################################################################
resource "aws_security_group_rule" "postgres_egress" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.postgres.id
}

####################################################################
resource "aws_db_subnet_group" "postgres" {
  name       = var.aws_db_subnet_name
  subnet_ids = var.aws_db_subnet_ids
}

####################################################################
resource "aws_db_parameter_group" "postgres" {
  name   = var.aws_db_parameter_name
  family = var.aws_db_parameter_family
}
