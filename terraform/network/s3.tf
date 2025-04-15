resource "aws_s3_bucket" "secure_bucket" {
  bucket = "fortistack-secure-bucket"
  force_destroy = true
}

# Block public access at the account + bucket level
resource "aws_s3_bucket_public_access_block" "block_all" {
  bucket                  = aws_s3_bucket.secure_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Enable encryption (AES256)
resource "aws_s3_bucket_server_side_encryption_configuration" "encrypt" {
  bucket = aws_s3_bucket.secure_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Enable versioning
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.secure_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Enable lifecycle rules (archive after 30 days)
resource "aws_s3_bucket_lifecycle_configuration" "lifecycle" {
  bucket = aws_s3_bucket.secure_bucket.id

  rule {
    id     = "archive-old"
    status = "Enabled"

    filter {
      prefix = ""  # 👈 This tells S3: "apply rule to ALL objects"
    }

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
  }
}


# Optional: logging (needs a separate bucket)
# resource "aws_s3_bucket_logging" "logging" {
#   bucket = aws_s3_bucket.secure_bucket.id
#   target_bucket = "your-logging-bucket-name"
#   target_prefix = "logs/"
# }

