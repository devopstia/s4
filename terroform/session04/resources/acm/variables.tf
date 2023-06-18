variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "domain_name" {
  type    = string
  default = "devopseasylearning.net"
}

variable "subject_alternative_names" {
  type    = string
  default = "*.devopseasylearning.net"
}

variable "common_tags" {
  type = map(any)
  default = {
    "AssetID"       = "2560"
    "Environment"   = "dev"
    "Project"       = "alpha"
    "CreateBy"      = "Terraform"
    "cloudProvider" = "aws"
  }
}
