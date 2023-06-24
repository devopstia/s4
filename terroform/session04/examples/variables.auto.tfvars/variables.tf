variable "aws_region" {
  type = string
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type        = string
  description = " "
}

variable "key_name" {
  type        = string
  description = " "
}

variable "vpc_security_group_ids" {
  type        = string
  description = " "
}

variable "subnet_id" {
  type        = string
  description = " "
}

variable "common_tags" {
  type = map(any)
}
