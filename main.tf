resource "aws_s3_bucket" "b" {
  bucket = "tn-tf-jenk-test-bucket"
  acl    = "private"

  tags {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

terraform {
  backend "s3" {
    bucket = "tn-testing-tf-state"
    key    = "jen-test.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
