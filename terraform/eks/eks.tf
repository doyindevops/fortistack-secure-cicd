resource "aws_eks_cluster" "main" {
  name     = "fortistack-eks"
  role_arn = "arn:aws:iam::123456789012:role/eks-role"
  vpc_config {
    subnet_ids = ["subnet-123", "subnet-456"]
  }
}
