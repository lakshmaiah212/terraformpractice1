output "subnets_id" {
  value = "${aws_subnet.publicsubnets.*.id}"
}

output "vpc_id" {
  value = "${aws_vpc.dev_vpc.id}"
}

