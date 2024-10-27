variable "domain_name" {
    description = "The main domain name"
    type = string
}

variable "subdomain" {
    description = "The subdomain prefix"
    type = string
}

variable "zone_id" {
    description = "The Route53 zone ID"
    type = string
}
