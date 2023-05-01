terraform {
  required_version = ">= 1.0.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" # this a single line comment
}


resource "aws_instance" "app_server" {
  ami           = "ami-08d4ac5b634553e16"
  instance_type = "t2.micro"

  tags = {
    Name = "web01"
  }
}
