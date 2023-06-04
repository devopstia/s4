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

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "aws-efs-csi-driver-sa" {
  type    = string
  default = "aws-efs-csi-driver-sa"
}

variable "aws-efs-csi-driver-ns" {
  type    = string
  default = "aws-efs-csi-driver"
}
