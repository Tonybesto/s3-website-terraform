variable "bucket_name" {
    description = "The name of the S3 bucket"
    type = string
}

variable "cloudfront_oai_arn" {
    description = "The ARN of the Cloudfront OAI"
    type = string
}

variable "cloudfront_oai_path" {
    description = "The Path of the CloudFront OAI"
    type = string
}