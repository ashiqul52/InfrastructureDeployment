# configured aws provider with proper credentials
provider "aws" {
  region    = "us-east-1"
  profile   = "ashiq"
}



resource "aws_s3_bucket" "example" {
  bucket = "ashiq-jenkins"

  lifecycle {
    prevent_destroy = true
  }
}


resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = "Enabled"
  }
}
