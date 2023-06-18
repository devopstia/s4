## Documentation
- [ExternalDNS packaged by Bitnami](https://artifacthub.io/packages/helm/bitnami/external-dns)
- [External DNS - Used for Updating Route53 RecordSets from Kubernetes](https://www.stacksimplify.com/aws-eks/aws-alb-ingress/install-externaldns-on-aws-eks/)
- [How do I set up ExternalDNS with Amazon EKS?](https://repost.aws/knowledge-center/eks-set-up-externaldns)


## Create the below policy and attach to EKS node group
```t
resource "aws_iam_policy" "example" {
  name        = format("%s-%s-%s-external-dns-policy", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
  description = "My IAM policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "route53:ChangeResourceRecordSets"
      ],
      "Resource": [
        "arn:aws:route53:::hostedzone/*"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "route53:ListHostedZones",
        "route53:ListResourceRecordSets"
      ],
      "Resource": [
        "*"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "example" {
  role       = aws_iam_role.nodes.name
  policy_arn = aws_iam_policy.example.arn
}
```

## create a namespace call external-dns
```
k create external-dns
```

## Apply the chart in the cluster
```
helm external-dns my-release oci://registry-1.docker.io/bitnamicharts/external-dns
```

## Pull this chart local
```
helm pull oci://registry-1.docker.io/bitnamicharts/external-dns --untar
```