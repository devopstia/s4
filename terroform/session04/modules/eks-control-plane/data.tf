data "aws_vpc" "alpha-vpc" {
  filter {
    name   = "tag:Name"
    values = ["2560-dev-alpha"]
  }
}

data "aws_subnet" "public01" {
  filter {
    name   = "tag:Name"
    values = ["2560-dev-alpha-public-subnet-1"]
  }
}

data "aws_subnet" "public02" {
  filter {
    name   = "tag:Name"
    values = ["2560-dev-alpha-public-subnet-2"]
  }
}

# resource "aws_eks_cluster" "example" {
#   name = "2526-dev-alpha"
# }
