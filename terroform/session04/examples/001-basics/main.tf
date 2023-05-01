provider "aws" {
  region = "us-east-1"
}

# terraform blocks

terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

resource "aws_instance" "example" {
  ami                    = "ami-0557a15b87f6559cf"
  instance_type          = "t2.medium"
  key_name               = "s4"
  subnet_id              = "subnet-096d45c28d9fb4c14"
  vpc_security_group_ids = ["sg-08ba925b7976f37bf"]
  tags = {
    Name = "web-through-terraform"
  }
  ebs_block_device {
    device_name = "/dev/sdf"
    volume_type = "gp2"
    volume_size = 10
  }
}


