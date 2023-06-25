aws_region             = "us-east-1"
aws_ami                = "ami-053b0d53c279acc90"
instance_type          = "t2.micro"
key_name               = "jenkins-key"
subnet_id              = "subnet-096d45c28d9fb4c14"
vpc_security_group_ids = ["sg-0c51540c60857b7ed"]
common_tags = {
  "AssetID"       = "2560"
  "AssetName"     = "Insfrastructure"
  "Teams"         = "DEL"
  "Environment"   = "dev"
  "Project"       = "alpha"
  "CreateBy"      = "Terraform"
  "cloudProvider" = "aws"
}
