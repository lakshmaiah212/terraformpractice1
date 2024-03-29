
######## public subnets ############################ 

resource "aws_subnet" "publicsubnets" {
  count = "${length(data.aws_availability_zones.available.names)}"
  vpc_id     = "${aws_vpc.test_vpc.id}"
  cidr_block = "${cidrsubnet(var.vpc_cidr, 3, count.index)}"

  tags = {
    Name = "publicsubnets-${count.index}"
    project_name = "${var.project_name}"
    project_env = "${var.project_env}"
  }
}


resource "aws_route_table" "publicroutabletable" {
  vpc_id = "${aws_vpc.test_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
  tags = {
    Name = "public routetable"
    project_name = "${var.project_name}"
    project_env = "${var.project_env}"

  }
}

resource "aws_route_table_association" "publicsubnetsassociation" {
  count = "${length(data.aws_availability_zones.available.names)}"
  subnet_id      = "${element(aws_subnet.publicsubnets.*.id, count.index)}"
  route_table_id = "${aws_route_table.publicroutabletable.id}"

}

######## private subnets ##########

resource "aws_subnet" "privatesubnets" {
  count = "${length(data.aws_availability_zones.available.names)}"
  vpc_id     = "${aws_vpc.test_vpc.id}"
  cidr_block = "${cidrsubnet(var.vpc_cidr, 3, count.index+6)}"

  tags = {
    Name = "privatesubnets-${count.index}"
    project_name = "${var.project_name}"
    project_env = "${var.project_env}"
  }
}

resource "aws_route_table" "privateroutabletable" {
  vpc_id = "${aws_vpc.test_vpc.id}"


  tags = {
    Name = "private routetable"
  }
}

resource "aws_route_table_association" "privatesubnetsassociation" {
  count = "${length(data.aws_availability_zones.available.names)}"
  subnet_id      = "${element(aws_subnet.privatesubnets.*.id, count.index)}"
  route_table_id = "${aws_route_table.privateroutabletable.id}"
}
