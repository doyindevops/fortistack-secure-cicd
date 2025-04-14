resource "aws_s3_bucket" "bad_bucket" {
  bucket = "fortistack-unsecure-bucket"
  acl    = "public-read"
}
