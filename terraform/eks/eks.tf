variable "vpc_id" {
  description = "VPC ID for the EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for the EKS cluster"
  type        = list(string)
}

resource "aws_iam_role" "eks_role" {
  name = "fortistack-eks-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "eks.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_role.name

  depends_on = [aws_iam_role.eks_role]
}

resource "aws_eks_cluster" "main" {
  name     = "fortistack-eks"
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids         = var.subnet_ids

    #  Lock down public endpoint
    endpoint_public_access  = false
    endpoint_private_access = true
  }

  #  Control plane logging
  enabled_cluster_log_types = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler"
  ]

  #  KMS Encryption (optional, can create a key and reference it)
  # encryption_config {
  #   resources = ["secrets"]
  #   provider {
  #     key_arn = "arn:aws:kms:your-custom-kms-key"
  #   }
  # }

  depends_on = [aws_iam_role_policy_attachment.eks_cluster_policy]
}

output "cluster_endpoint" {
  value = aws_eks_cluster.main.endpoint
}

output "cluster_certificate_authority_data" {
  value = aws_eks_cluster.main.certificate_authority[0].data
}

output "cluster_name" {
  value = aws_eks_cluster.main.name
}
