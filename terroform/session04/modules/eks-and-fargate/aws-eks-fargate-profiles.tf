resource "aws_eks_fargate_profile" "app" {
  cluster_name           = format("%s-%s-%s", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
  fargate_profile_name   = "tia"
  pod_execution_role_arn = aws_iam_role.eks-fargate-profile.arn

  # These subnets must have the following resource tag: 
  # kubernetes.io/cluster/<CLUSTER_NAME>.
  subnet_ids = [
    data.aws_subnet.private_subnet1.id,
    data.aws_subnet.private_subnet2.id
  ]
  selector {
    namespace = "tia"
  }
}

# resource "aws_eks_fargate_profile" "external-dns" {
#   cluster_name           = format("%s-%s-%s", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
#   fargate_profile_name   = "external-dns"
#   pod_execution_role_arn = aws_iam_role.eks-fargate-profile.arn

#   # These subnets must have the following resource tag: 
#   # kubernetes.io/cluster/<CLUSTER_NAME>.
#   subnet_ids = [
#     data.aws_subnet.private_subnet1.id,
#     data.aws_subnet.private_subnet2.id
#   ]
#   selector {
#     namespace = "external-dns"
#   }
# }

# resource "aws_eks_fargate_profile" "aws-ebs-csi-driver" {
#   cluster_name           = format("%s-%s-%s", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
#   fargate_profile_name   = "aws-ebs-csi-driver"
#   pod_execution_role_arn = aws_iam_role.eks-fargate-profile.arn

#   # These subnets must have the following resource tag: 
#   # kubernetes.io/cluster/<CLUSTER_NAME>.
#   subnet_ids = [
#     data.aws_subnet.private_subnet1.id,
#     data.aws_subnet.private_subnet2.id
#   ]
#   selector {
#     namespace = "aws-ebs-csi-driver"
#   }
# }

# resource "aws_eks_fargate_profile" "aws-efs-csi-driver" {
#   cluster_name           = format("%s-%s-%s", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
#   fargate_profile_name   = "aws-efs-csi-driver"
#   pod_execution_role_arn = aws_iam_role.eks-fargate-profile.arn

#   # These subnets must have the following resource tag: 
#   # kubernetes.io/cluster/<CLUSTER_NAME>.
#   subnet_ids = [
#     data.aws_subnet.private_subnet1.id,
#     data.aws_subnet.private_subnet2.id
#   ]
#   selector {
#     namespace = "aws-efs-csi-driver"
#   }
# }
