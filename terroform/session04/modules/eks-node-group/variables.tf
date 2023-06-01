variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "node_group" {
  type = map(any)
  default = {
    desired_size   = 1
    min_size     = 1
    max_size     = 5
    ami_type             = "AL2_x86_64"
    capacity_type        = "ON_DEMAND"
    disk_size            = 20
    force_update_version = false
    instance_types       = ["t2.micro"]
    ec2_ssh_key = "terraform"
    alpha = "guru"
    version = "1.24"
  }
}


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

