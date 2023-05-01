
variable "region" {
  type = string
}

variable "dynamodb-table-name" {
  type = string
}

variable "read_capacity" {
  type    = string
  default = "5"
}

variable "write_capacity" {
  type    = string
  default = "5"
}

variable "bucket-name" {
  type = string
}

variable "versioning_enable" {
  type    = string
  default = true
}

variable "tags" {
  type = map(string)
  default = {
    Owner       = "PECS"
    Project     = "Apha"
    Environment = "dev"
    Create_By   = "Terraform"
  }
}
