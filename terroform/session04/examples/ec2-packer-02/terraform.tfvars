aws_region    = "us-east-1"
ami           = "ami-0eb5c571bf15422ac"
instance_type = "t2.micro"
key_name      = "terraform"
subnet_id     = "subnet-096d45c28d9fb4c14"
common_tags = {
  "AssetID"       = "2560"
  "AssetName"     = "Insfrastructure"
  "Teams"         = "DEL"
  "Environment"   = "dev"
  "Project"       = "tia"
  "CreateBy"      = "Terraform"
  "cloudProvider" = "aws"
}
