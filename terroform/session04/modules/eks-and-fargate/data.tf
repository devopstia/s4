data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["2560-dev-alpha"]
  }
}

data "aws_subnet" "private_subnet1" {
  filter {
    name   = "tag:Name"
    values = ["2560-dev-alpha-private-subnet-1"]
  }
}

data "aws_subnet" "private_subnet2" {
  filter {
    name   = "tag:Name"
    values = ["2560-dev-alpha-private-subnet-2"]
  }
}

data "aws_eks_cluster" "example" {
  name = format("%s-%s-%s", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
}

data "aws_eks_cluster_auth" "example" {
  name = format("%s-%s-%s", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
}

# Get AWS Account ID
data "aws_caller_identity" "current" {}
