resource "aws_vpc" "test_vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "dev_vpc"
    project_name = "${var.project_name}"
    project_env = "${var.project_env}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.test_vpc.id}"

  tags = {
    Name = "test-igw"
    project_name = "${var.project_name}"
    project_env = "${var.project_env}"

  }
}