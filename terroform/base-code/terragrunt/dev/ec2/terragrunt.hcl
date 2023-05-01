terraform {
  source = "../../../modules/ec2"
}

include {
  path = find_in_parent_folders()
}

inputs = {
    aws_region    = "us-east-1"
    instance_type = "t2.medium"
    instance_ami  = "ami-052efd3df9dad4825"
    instance_name = "development-web-01"
}
