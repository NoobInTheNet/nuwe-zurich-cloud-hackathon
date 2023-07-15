module "s3_bucket" {
  source = "./modules/s3"

  stack_name   = var.stack_name
  api_endpoint = module.api_gateway.invoke_url
}

module "lambda_function" {
  source = "./modules/lambda"

  stack_name = var.stack_name
}

module "api_gateway" {
  source = "./modules/api_gateway"

  stack_name                 = var.stack_name
  lambda_function_invoke_arn = module.lambda_function.invoke_arn
  lambda_function_name       = module.lambda_function.name
}
