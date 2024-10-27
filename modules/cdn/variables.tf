variable "domain_name" {
    description = "The domain name for the CloudFront"
    type = string
}

variable "certificate_arn" {
    description = "The ARN of the ACM certificate"
    type = string
}

variable "s3_bucket_domain_name" {
    description = "The domain name of the S3 bucket"
    type = string
}

variable "s3_bucket_id" {
    description = "The ID of the S3 bucket"
    type = string
}