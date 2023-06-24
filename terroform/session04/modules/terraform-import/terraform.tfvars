aws_region             = "us-east-1"
aws_ami                = "ami-0c57a5831a984f2f0"
instance_type          = "t2.micro"
key_name               = "jenkins-key"
subnet_id              = "subnet-096d45c28d9fb4c14"
vpc_security_group_ids = ["sg-08ba925b7976f37bf"]
common_tags = {
  "AssetID"       = "2560"
  "AssetName"     = "Insfrastructure"
  "Teams"         = "DEL"
  "Environment"   = "dev"
  "Project"       = "alpha"
  "CreateBy"      = "Terraform"
  "cloudProvider" = "aws"
}
