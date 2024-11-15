data "aws_route53_zone" "main" {
  name = var.domain_name
  private_zone = false
}

module "certificate" {
  source      = "./modules/certificate"
  domain_name = var.domain_name
  subdomain   = var.subdomain
  zone_id     = data.aws_route53_zone.main.zone_id
}

module "cdn" {
  source               = "./modules/cdn"
  domain_name         = "${var.subdomain}.${var.domain_name}"
  certificate_arn     = module.certificate.certificate_arn
  s3_bucket_domain_name = module.storage.bucket_regional_domain_name
  s3_bucket_id        = module.storage.bucket_id
  depends_on = [module.certificate]
}

module "storage" {
  source             = "./modules/storage"
  bucket_name        = "${var.subdomain}.${var.domain_name}"
  cloudfront_oai_arn = module.cdn.oai_arn
  cloudfront_oai_path = module.cdn.oai_path
}

module "dns" {
  source                    = "./modules/dns"
  zone_id                   = data.aws_route53_zone.main.zone_id
  domain_name              = "${var.subdomain}.${var.domain_name}"
  cloudfront_domain_name   = module.cdn.distribution_domain_name
  cloudfront_hosted_zone_id = module.cdn.distribution_hosted_zone_id
}