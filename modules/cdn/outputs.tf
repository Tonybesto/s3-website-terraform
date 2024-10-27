output "distribution_domain_name" {
    value = aws_cloudfront_distribution.website.domain_name 
}

output "distribution_hosted_zone_id" {
  value = aws_cloudfront_distribution.website.hosted_zone_id
}

output "distribution_id" {
  value = aws_cloudfront_distribution.website.id
}

output "oai_arn" {
  value = aws_cloudfront_origin_access_identity.oai.iam_arn
}

output "oai_path" {
  value = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
}