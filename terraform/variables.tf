variable "aws_region" {
  default = "us-east-1"
}

variable "ec2_key_name" {
  description = "EC2 Key Pair name passed from root module"
  type        = string
}



