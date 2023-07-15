output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = module.s3_bucket.bucket_arn
}

output "lambda_function_arn" {
  description = "The ARN of the Lambda function"
  value       = module.lambda_function.arn
}

output "api_gateway_url" {
  description = "The URL of the API Gateway"
  value       = module.api_gateway.invoke_url
}
