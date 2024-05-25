output "general_purpose_bucket_arn" {
  description = "ARN of the general purpose S3 bucket"
  value       = aws_s3_bucket.general_purpose_bucket.arn
}

output "directory_bucket_arn" {
  description = "ARN of the directory S3 bucket"
  value       = aws_s3_bucket.directory_bucket.arn
}
