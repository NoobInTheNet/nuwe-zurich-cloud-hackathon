module "s3" {
  source       = "./modules/s3"
  environment  = var.deployment_environment
  api_endpoint = module.api_gateway.api_endpoint
  bucket_name  = "${var.stack_name}-s3-bucket"
}

module "cloudfront" {
  source       = "./modules/cloudfront"
  s3_bucket_id = module.s3.bucket_id
}

module "lambda_edge" {
  source        = "./modules/lambda_edge"
  function_name = "${var.stack_name}-lambda"
  s3_bucket_id  = module.s3.bucket_id
}

module "api_gateway" {
  source            = "./modules/api_gateway"
  api_name          = "${var.stack_name}-api"
  lambda_invoke_arn = module.lambda_edge.function_invoke_arn
}
