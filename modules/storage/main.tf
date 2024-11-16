resource "aws_s3_bucket" "s3_website" {
    bucket = var.bucket_name
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

# Upload index.html to the bucket
resource "aws_s3_object" "index" {
    bucket = aws_s3_bucket.s3_website.id
    key    = "index.html"
    source = "${path.module}/index.html"
    
    content_type = "text/html"
    
    etag = filemd5("${path.module}/index.html")

    depends_on = [aws_s3_bucket.s3_website] 
}

resource "aws_s3_object" "error" {
    bucket = aws_s3_bucket.s3_website.id
    key    = "error.html"
    source = "${path.module}/error.html"
    
    content_type = "text/html"
    etag = filemd5("${path.module}/error.html")

    depends_on = [aws_s3_bucket.s3_website] 
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
                    "AWS" = var.cloudfront_oai_arn
                }
                Action   = "s3:GetObject"
                Resource = "${aws_s3_bucket.s3_website.arn}/*"
            }
        ]
    })
}
