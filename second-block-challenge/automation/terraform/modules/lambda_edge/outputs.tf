output "function_invoke_arn" {
  description = "Lambda's function name."
  value       = aws_lambda_function.lambda.invoke_arn
}
