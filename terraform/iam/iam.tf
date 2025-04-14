resource "aws_iam_policy" "bad_policy" {
  name        = "example-policy"
  description = "Wild policy for testing"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = "*",
        Resource = "*"
      }
    ]
  })
}
