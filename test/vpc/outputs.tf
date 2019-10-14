output "vpc_id" {
    value = "${aws_vpc.test_vpc.id}"
}

output "publicsubnets_id" {
  value = "${aws_subnet.publicsubnets.*.id}"
}

output "privatesubnets_id" {
  value = "${aws_subnet.privatesubnets.*.id}"
}


