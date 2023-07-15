output "name" {
  description = "The name of the function"
  value       = aws_lambda_function.function.function_name
}

output "arn" {
  description = "The ARN of the function"
  value       = aws_lambda_function.function.arn
}

output "invoke_arn" {
  description = "The ARN to be used for invoking Lambda Function from API Gateway"
  value       = aws_lambda_function.function.invoke_arn
}
