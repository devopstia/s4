# get details about a route 53 hosted zone
data "aws_route53_zone" "route53_zone" {
  name = var.domain_name
  # This can be true or false
  private_zone = false
}
