resource "aws_vpc" "dev_vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "dedicated"

  tags = {
    Name = "dev_vpc"
    project_name = "${var.project_name}"
    project_env = "${var.project_env}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.dev_vpc.id}"

  tags = {
    Name = "igw"
    project_name = "${var.project_name}"
    project_env = "${var.project_env}"
  }
}