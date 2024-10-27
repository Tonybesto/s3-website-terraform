output "website_endpoint" {
  description = "The website endpoint"
  value       = "https://${var.subdomain}.${var.domain_name}"
}

output "cloudfront_distribution_id" {
  description = "The ID of the CloudFront distribution"
  value       = module.cdn.distribution_id
}

output "s3_bucket_name" {
  description = "The name of the S3 bucket"
  value       = module.storage.bucket_id
}