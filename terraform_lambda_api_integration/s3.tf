resource "aws_s3_bucket" "bucket" {
  bucket = "test-123-test"
  acl = "private"
  versioning {
    enabled = true
  }
  tags = {
    Name   = "test_bucket"
  }
}

resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.bucket.bucket
  source = "${path.module}/randomnumber.zip"
  key = "lambda-functions/randomnumber.zip"
  etag = filemd5("${path.module}/randomnumber.zip")
}
