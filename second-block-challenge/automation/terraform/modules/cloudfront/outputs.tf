output "cloudfront_domain_name" {
  description = "CloudFront distribution's domain name."
  value       = aws_cloudfront_distribution.distribution.domain_name
}
