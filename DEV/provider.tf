provider "aws" {}

terraform {
  backend "s3" {
    bucket = "lakshmaiahaws.xyz"
    key    = "terraformpractice2/dev/terraform.tfstate"
    region = "us-east-1"
  }
}
