# Create the S3 bucket
resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}

# Define a bucket policy to allow public read access to objects
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.bucket.id}/*"
    }
  ]
}
EOF
}

# Set the ACL (Access Control List) for the S3 bucket
resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id

  owner {
    id           = aws_s3_bucket.bucket.owner_id
    display_name = aws_s3_bucket.bucket.owner_display_name
  }

  grants = [
    {
      id           = "CanonicalUser:${aws_s3_bucket.bucket.owner_id}"
      permission   = "FULL_CONTROL"
      type         = "CanonicalUser"
      display_name = aws_s3_bucket.bucket.owner_display_name
    }
  ]
}

# Render the index.html template file with the API endpoint
data "template_file" "index_html" {
  template = file("${path.module}/../../../../app/frontend/index.html.tmplt")

  vars = {
    API_ENDPOINT = var.api_endpoint
  }
}

# Upload the rendered index.html file to the S3 bucket
resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.bucket.id
  key          = "index.html"
  content_type = "text/html"
  content      = data.template_file.index_html.rendered
  acl          = "public-read"
}
