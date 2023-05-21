variable "aws_region" {
  type = string
}

variable "vpc_cidr_block" {
  type = string
}


variable "common_tags" {
  type = map(any)
}

variable "subnets_cidr_block" {
  type = list(any)
}

variable "availability_zone" {
  type = list(any)

}

variable "cluster_name" {
  type = string
}

