variable "common_tags" {
  type = map(any)
  default = {
    "AssetID"       = "2526"
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

variable "aws-ebs-csi-driver-sa" {
  type    = string
  default = "aws-ebs-csi-driver-sa"
}

variable "aws-ebs-csi-driver-ns" {
  type    = string
  default = "aws-ebs-csi-driver"
}

