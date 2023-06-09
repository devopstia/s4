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

variable "aws-load-balancer-controller-sa" {
  type    = string
  default = "aws-load-balancer-controller-sa"
}

variable "aws-load-balancer-controller-ns" {
  type    = string
  default = "kube-system"
}
