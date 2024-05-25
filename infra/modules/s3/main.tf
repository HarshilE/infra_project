
# General purpose S3 bucket
resource "aws_s3_bucket" "general_purpose_bucket" {
  bucket = var.general_purpose_bucket_name

  tags = {
    Name        = var.general_purpose_bucket_name
    Environment = var.environment
  }
}

# Directory S3 bucket
resource "aws_s3_bucket" "directory_bucket" {
  bucket = var.directory_bucket_name

  tags = {
    Name        = var.directory_bucket_name
    Environment = var.environment
  }
}

# Bucket policy for general purpose bucket
resource "aws_s3_bucket_policy" "general_purpose_bucket_policy" {
  bucket = aws_s3_bucket.general_purpose_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ]
        Resource = "${aws_s3_bucket.general_purpose_bucket.arn}/*"
      }
    ]
  })
}

# Bucket policy for directory bucket
resource "aws_s3_bucket_policy" "directory_bucket_policy" {
  bucket = aws_s3_bucket.directory_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ]
        Resource = "${aws_s3_bucket.directory_bucket.arn}/*"
      }
    ]
  })
}
