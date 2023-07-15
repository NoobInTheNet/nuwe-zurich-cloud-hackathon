output "bucket_id" {
  description = "The name of the bucket"
  value       = aws_s3_bucket.bucket.id
}

output "bucket_arn" {
  description = "The ARN of the bucket"
  value       = aws_s3_bucket.bucket.arn
}

output "bucket_website_endpoint" {
  description = "The website endpoint of the bucket"
  value       = aws_s3_bucket_website_configuration.bucket.website_endpoint
}
