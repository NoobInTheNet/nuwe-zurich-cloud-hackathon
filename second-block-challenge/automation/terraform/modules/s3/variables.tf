variable "bucket_name" {
  description = "S3 bucket's name."
  type = string
}

variable "environment" {
  description = "S3 bucket's deployment environment."
  type = string
}

variable "api_endpoint" {
  description = "API Gateway's endpoint to reach for the image upload."
  type = string
}