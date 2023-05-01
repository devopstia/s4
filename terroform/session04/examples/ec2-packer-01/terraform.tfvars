aws_region    = "us-east-1"
ami           = "ami-04ea7a305e6fdab34"
instance_type = "t2.micro"
key_name      = "s4"
subnet_id     = "subnet-096d45c28d9fb4c14"
common_tags = {
  "AssetID"       = "2560"
  "AssetName"     = "Insfrastructure"
  "Teams"         = "DEL"
  "Environment"   = "dev"
  "Project"       = "alpha"
  "CreateBy"      = "Terraform"
  "cloudProvider" = "aws"
}
