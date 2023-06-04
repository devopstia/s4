
data "aws_eks_cluster" "example" {
  name = format("%s-%s-%s", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
}

data "tls_certificate" "example" {
  url = data.aws_eks_cluster.example.identity.0.oidc.0.issuer
}
