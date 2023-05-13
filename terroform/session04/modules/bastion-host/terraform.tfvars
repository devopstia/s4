aws_region    = "us-east-1"
instance_type = "t2.micro"
ami           = "ami-0eb5c571bf15422ac"
key_name      = "s4"
common_tags = {
  "AssetID"       = "2560"
  "AssetName"     = "Insfrastructure"
  "Teams"         = "DEL"
  "Environment"   = "dev"
  "Project"       = "alpha"
  "CreateBy"      = "Terraform"
  "cloudProvider" = "aws"
}
