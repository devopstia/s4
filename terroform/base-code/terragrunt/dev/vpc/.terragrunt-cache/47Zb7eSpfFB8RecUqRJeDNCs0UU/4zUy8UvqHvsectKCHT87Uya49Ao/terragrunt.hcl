terraform {
  source = "../../../modules/vpc"
}
include {
  path = find_in_parent_folders()
}

inputs = {
    vpc_cidr   = "10.0.0.0/16"
    vpc_name   = "development-vpc"
    aws_region = "us-east-1"
}
