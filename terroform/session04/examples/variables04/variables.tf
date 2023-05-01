variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "ami" {
  type    = string
  default = "ami-007855ac798b5175e"
}

variable "instance_type" {
  type        = string
  description = " "
  default     = "t2.micro"
}

variable "key_name" {
  type        = string
  description = " "
  default     = "s4"
}

variable "vpc_security_group_ids" {
  type        = string
  description = " "
  default     = "sg-08ba925b7976f37bf"
}

variable "subnet_id" {
  type        = string
  description = " "
  default     = "subnet-096d45c28d9fb4c14"
}

variable "common_tags" {
  type = map(any)
  default = {
    "Name"          = "web01"
    "AssetID"       = "2560"
    "AssetName"     = "Insfrastructure"
    "Teams"         = "DEL"
    "Environment"   = "dev"
    "Project"       = "alpha"
    "CreateBy"      = "Terraform"
    "cloudProvider" = "aws"
  }
}
