provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  tags = {
    Name        = format("%s-%s-%s-webserver", var.tags.Access-ID, var.tags.Project, var.tags.Environment)
    Owner       = var.tags.Owner
    Access-ID   = var.tags.Access-ID
    Project     = var.tags.Project
    Environment = var.tags.Environment
    Create_By   = var.tags.Create_By
  }
}

resource "aws_instance" "app_server05" {
  ami           = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  count         = 5
  tags = {
    Name        = format("zclogs-%s-webserver%02d", var.tags.Environment, count.index + 1)
    Owner       = var.tags.Owner
    Access-ID   = var.tags.Access-ID
    Project     = var.tags.Project
    Environment = var.tags.Environment
    Create_By   = var.tags.Create_By
  }
}


resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name        = format("%s-%s-%s-vpc", var.tags.Access-ID, var.tags.Project, var.tags.Environment)
    Owner       = var.tags.Owner
    Access-ID   = var.tags.Access-ID
    Project     = var.tags.Project
    Environment = var.tags.Environment
    Create_By   = var.tags.Create_By
  }
}


variable "tags" {
  type = map(string)
  default = {
    Owner       = "SRP"
    Access-ID   = "2645"
    Project     = "srp"
    Environment = "dev"
    Create_By   = "Terraform"
  }
}


