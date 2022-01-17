resource "aws_s3_bucket" "bucket-sk14" {
  bucket = "sk-14061406-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"

  }

