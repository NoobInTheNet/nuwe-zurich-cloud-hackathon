variable "api_name" {
  description = "The name of the API Gateway endpoint."
  type        = string
}

variable "lambda_invoke_arn" {
  description = "The invoke ARN of the Lambda function."
  type        = string
}
