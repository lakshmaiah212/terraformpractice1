resource "aws_subnet" "publicsubnets" {
  count = "${length(data.aws_availability_zones.available.names)}"
  vpc_id     = "${aws_vpc.dev_vpc.id}"
  cidr_block = "${cidrsubnet(var.vpc_cidr, 3, count.index)}"
  availability_zone = "${element(data.aws_availability_zones.available.names, count.index)}"
  map_public_ip_on_launch = true

  tags = {
    Name = "publicsubnets-${count.index}"
    project_name = "{var.project_name}"
    project_env = "{var.project_env}"
  }
}

##### ROUTE TABLE #######

resource "aws_route_table" "publicroutetable" {
  vpc_id = "${aws_vpc.dev_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }


  tags = {
    Name = "publicroutetable"
    project_name = "{var.project_name}"
    project_env = "{var.project_env}"
  }
}

### route table association #######

resource "aws_route_table_association" "publicroutetableassociation" {
  count = "${length(data.aws_availability_zones.available.names)}"
  subnet_id      = "${element(aws_subnet.publicsubnets.*.id,count.index)}"
  route_table_id = "${aws_route_table.publicroutetable.id}"
}