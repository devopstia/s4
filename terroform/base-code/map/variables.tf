variable "tags" {
  type = map(string)
  default = {
    Name        = "dev-web-server"
    Owner       = "SRP"
    Access-ID   = "2645"
    Project     = "srp"
    Environment = "dev"
    Create_By   = "Terraform"
  }
}
