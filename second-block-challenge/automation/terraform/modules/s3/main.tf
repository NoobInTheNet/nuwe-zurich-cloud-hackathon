resource "aws_s3_bucket" "bucket" {
  bucket = "${var.stack_name}-s3-bucket"

  tags = {
    Name = "${var.stack_name}-s3-bucket"
  }
}

resource "aws_s3_bucket_website_configuration" "bucket" {
  bucket = aws_s3_bucket.bucket.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_ownership_controls" "bucket" {
  depends_on = [aws_s3_bucket.bucket]
  bucket     = aws_s3_bucket.bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "bucket" {
  depends_on = [aws_s3_bucket_ownership_controls.bucket]
  bucket     = aws_s3_bucket.bucket.arn
  acl        = "private"
}

data "template_file" "webapp_index_template" {
  template = file("${path.module}/../../../../app/frontend/index.html.tpl")
  vars = {
    API_ENDPOINT = var.api_endpoint
  }
}

resource "aws_s3_object" "webapp_index" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "public-read"
  key    = "index.html"
  source = data.template_file.webapp_index_template.rendered

  etag = md5(data.template_file.webapp_index_template.rendered)
}
