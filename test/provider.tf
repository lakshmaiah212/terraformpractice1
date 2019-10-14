provider "aws" {}

terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "terraformproject1/test/terraform.tfstate"
    region = "us-east-1"
  }
}
