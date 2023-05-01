# data "aws_vpc" "bamboo_vpc" {
#   filter {
#     name   = "tag:Name"
#     values = ["Tia-public"]
#   }
# }

# data "aws_subnet" "db-subnet-public-01" {
#   filter {
#     name   = "tag:Name"
#     values = ["public-subnet-01"]
#   }
# }

# data "aws_subnet" "db-subnet-public-02" {
#   filter {
#     name   = "tag:Name"
#     values = ["public-subnet-02"]
#   }
# }


# https://www.andreagrandi.it/2017/08/25/getting-latest-ubuntu-ami-with-terraform/


## Data source blocks
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


## Data source blocks
data "aws_ami" "amzlinux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}
