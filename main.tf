provider "aws" {
  region     = "us-east-1"
}

resource "aws_s3_bucket" "b" {
  bucket = "a-tn-tfstate-test"
  acl    = "private"

  tags {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

terraform {
  backend "s3" {
    bucket = "tn-tfstate"
    key    = "jen-test.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
