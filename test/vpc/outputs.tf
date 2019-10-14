output "vpc_id" {}

output "publicsubnets_id" {
  value = "${aws_subnet.publicsubnets.*.id}"
}

output "privatesubnets_id" {
  value = "${aws_subnet.privatesubnets.*.id}"
}


