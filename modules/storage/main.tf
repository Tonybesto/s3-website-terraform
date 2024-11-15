resource "aws_s3_bucket" "s3_website" {
    bucket = var.domain_name
}

resource "aws_s3_bucket_website_configuration" "website" {
    bucket = aws_s3_bucket.s3_website.id

    index_document {
        suffix = "index.html"
    }

    error_document {
        key = "error.html"
    }
}

resource "aws_s3_bucket_policy" "website" {
    bucket = aws_s3_bucket.s3_website.id

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Sid       = "PublicReadGetObject"
                Effect    = "Allow"
                Principal = {
                    CanonicalUser = var.cloudfront_oai_arn
                }
                Action   = "s3:GetObject"
                Resource = "${aws_s3_bucket.s3_website.arn}/*"
            }
        ]
    })
}
