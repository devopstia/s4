provider "aws" {
  region = "us-east-1"
}

# variable "aws-secret-string" {
#   type = list(string)
#   default = [
#     "jenkins",
#     "splunk_key",
#     "argocd",
#     "aws-key",
#     "elk-key"
#   ]
# }

# resource "aws_secretsmanager_secret" "example" {
#   count = length(var.aws-secret-string)
#   name  = var.aws-secret-string[count.index]
#   tags = {
#     "Terraform" = "true"
#     "Project"   = "MAM"
#   }
# }




variable "aws-secret-string" {
  type = set(string)
  default = [
    "jenkins",
    "splunk_key",
    "aws-key",
    "elk-key"
  ]
}

resource "aws_secretsmanager_secret" "example" {
  for_each = var.aws-secret-string
  name     = each.value
  tags = {
    "Terraform" = "true"
    "Project"   = "MAM"
  }
}


