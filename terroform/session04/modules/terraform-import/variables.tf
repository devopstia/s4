variable "aws_region" {
  type = string
}

variable "aws_ami" {
  type = string
}

variable "instance_type" {
  type        = string
  description = " "
}

variable "key_name" {
  type        = string
  description = " "
}

variable "subnet_id" {
  type        = string
  description = " "
}

variable "vpc_security_group_ids" {
  type        = list(any)
  description = " "
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
