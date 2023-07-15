output "bucket_id" {
  description = "S3 bucket's ID."
  value       = aws_s3_bucket.bucket.id
}
