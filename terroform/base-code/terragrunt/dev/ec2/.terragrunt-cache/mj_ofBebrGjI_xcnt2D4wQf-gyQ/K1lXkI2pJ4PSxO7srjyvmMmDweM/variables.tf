variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "instance_ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_name" {
  type    = string
  default = "ec2-dev"
}
