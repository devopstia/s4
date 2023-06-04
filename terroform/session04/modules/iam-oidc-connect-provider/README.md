## Terraform external data source EKS thumbprint not working sometimes
https://stackoverflow.com/questions/64624411/terraform-external-data-source-eks-thumbprint-not-working-sometimes

```s
esource "aws_eks_cluster" "example" {
  name = "example"
}

data "tls_certificate" "example" {
  url = aws_eks_cluster.example.identity.0.oidc.0.issuer
}

resource "aws_iam_openid_connect_provider" "example" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.example.certificates.0.sha1_fingerprint]
  url             = aws_eks_cluster.example.identity.0.oidc.0.issuer
}
```