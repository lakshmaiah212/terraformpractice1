resource "aws_vpc" "dev_vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "dev_vpc"
    project_name = "${var.project_name}"
    project_env = "${var.project_env}"
    created_with = "terraform"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.dev_vpc.id}"

  tags = {
    Name = "igw"
  }
}