output "rest_api_id" {
  description = "The ID of the REST API"
  value       = aws_api_gateway_rest_api.api.id
}

output "resource_id" {
  description = "The ID of the resource"
  value       = aws_api_gateway_resource.resource.id
}

output "method_http_method" {
  description = "The HTTP method of the method"
  value       = aws_api_gateway_method.method.http_method
}

output "integration_uri" {
  description = "The URI of the integration"
  value       = aws_api_gateway_integration.integration.uri
}

output "execution_arn" {
  description = "The execution ARN to be used in lambda_permission's source_arn when allowing API Gateway to call a Lambda function"
  value       = aws_api_gateway_rest_api.api.execution_arn
}

output "invoke_url" {
  description = "The URL to invoke the API Gateway"
  value       = aws_api_gateway_deployment.deployment.invoke_url
}
