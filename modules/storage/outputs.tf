output "bucket_regional_domain_name" {
    value = aws_s3_bucket.s3_website.bucket_regional_domain_name
}

output "bucket_id" {
  value = aws_s3_bucket.s3_website.id
}