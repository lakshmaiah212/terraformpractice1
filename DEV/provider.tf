provider "aws" {}

terraform {
  backend "s3" {
    bucket = "lakshmaiahaws.xyz"
    key    = "practice1/dev/terraform.tfstate"
    region = "us-east-1"
  }
}
