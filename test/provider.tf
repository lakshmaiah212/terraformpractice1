provider "aws" {}

terraform {
  backend "s3" {
    bucket = "lakshmaiahaws.xyz"
    key    = "test/terraform.tfstate"
    region = "us-east-1"
  }
}
