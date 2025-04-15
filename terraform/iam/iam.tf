resource "aws_iam_policy" "secure_policy" {
  name        = "fortistack-secure-policy"
  description = "Least privilege policy for managing EKS and networking"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid = "AllowEKSReadWrite",
        Effect = "Allow",
        Action = [
          "eks:Describe*",
          "eks:List*",
          "eks:UpdateClusterConfig",
          "eks:UpdateNodegroupConfig",
          "eks:Create*",
          "eks:Delete*"
        ],
        Resource = "*"
      },
      {
        Sid = "AllowEC2Networking",
        Effect = "Allow",
        Action = [
          "ec2:Describe*",
          "ec2:CreateSecurityGroup",
          "ec2:AuthorizeSecurityGroupIngress",
          "ec2:CreateVpc",
          "ec2:DeleteVpc",
          "ec2:CreateSubnet",
          "ec2:DeleteSubnet"
        ],
        Resource = "*"
      },
      {
        Sid = "AllowS3ReadOnly",
        Effect = "Allow",
        Action = [
          "s3:ListAllMyBuckets",
          "s3:GetBucketLocation",
          "s3:GetObject"
        ],
        Resource = "*"
      }
    ]
  })
}
