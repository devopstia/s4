variable "aws_region" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "subject_alternative_names" {
  type = string
}

variable "common_tags" {
  type = map(any)
}
