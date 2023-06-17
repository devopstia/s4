resource "aws_eks_fargate_profile" "kube-system" {
  cluster_name           = format("%s-%s-%s", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
  fargate_profile_name   = "kube-system"
  pod_execution_role_arn = aws_iam_role.eks-fargate-profile.arn

  # These subnets must have the following resource tag: 
  # kubernetes.io/cluster/<CLUSTER_NAME>.
  # These subnets must be private subnets 
  subnet_ids = [
    data.aws_subnet.private_subnet1.id,
    data.aws_subnet.private_subnet2.id
  ]

  selector {
    namespace = "kube-system"
  }
}
