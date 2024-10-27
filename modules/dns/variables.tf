variable "zone_id" {
    description = "The Route53 zone ID"
    type = string
}

variable "domain_name" {
    description = "The full domain name for the DNS record"
    type = string
}

variable "cloudfront_domain_name" {
    description = "The CloudFront Distribution domain name"
    type = string
}

variable "cloudfront_hosted_zone_id" {
  description = "The CloudFront distribution hosted zone ID"
  type        = string
}