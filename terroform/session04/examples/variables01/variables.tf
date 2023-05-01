variable "aws_region" {
  type = list(any)
  default = [
    "us-east-1",
    "us-east-2"
  ]
}



variable "ami" {
  type        = map(any)
  description = "This is for EC2 ami"
  default = {
    ami_1 = "ami-007855ac798b5175e",
    ami_2 = "ami-0a695f0d95cefc163"
  }
}

variable "instance_type" {
  type        = string
  description = " "
  default     = "t2.micro"
}

variable "key_name" {
  type        = list(any)
  description = " "
  default     = ["s4", "s5tia"]
}

variable "vpc_security_group_ids" {
  type        = map(any)
  description = " "
  default = {
    vpc_security_group_id_1 = "sg-08ba925b7976f37bf",
    vpc_security_group_id_2 = "sg-c9a851ac"
  }
}

variable "subnet_id" {
  type        = list(any)
  description = " "
  default = [
    "subnet-096d45c28d9fb4c14",
    "subnet-05f285a35173783b0",

    "subnet-be42a6d5",
    "subnet-ae9f1ae2"
  ]
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

variable "create_instance" {
  type    = bool
  default = false
}
