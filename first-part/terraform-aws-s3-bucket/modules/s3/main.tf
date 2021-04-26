resource "aws_s3_bucket" "bd" {
    bucket          = "${var.bucketname}"
    acl             = "${var.acl}"
    tags {
        Name        = "${var.bucketname}"
        Environment = "${var.env}"
    }
    versioning {
        enabled     = true
    }
    lifecycle_rule {
    id      = "${var.lifecycle_rule}"
    enabled = true
    prefix = "${var.lifecycle_rule}/"

    tags = {
      rule      = "${var.lifecycle_rule}"
      autoclean = "true"
    }

    transition {
      days          = "${var.transition}"
      storage_class = "GLACIER"
    }

    expiration {
      days = "${var.expiration}"
      }
    }
}

resource "aws_s3_bucket_policy" "bd" {
  bucket = aws_s3_bucket.bd.id
  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "MYBUCKETPOLICY"
    Statement = [
      {
        Sid       = "IPAllow"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          aws_s3_bucket.b.arn,
          "${aws_s3_bucket.bd.arn}/*",
        ]
        Condition = {
          IpAddress = {
            "aws:SourceIp" = "10.0.0.0/8"
          }
        }
      },
    ]
  })
}
