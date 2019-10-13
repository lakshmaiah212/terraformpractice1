resource "aws_instance" "web" {
  ami           = "ami-00eb20669e0990cb4"
  instance_type = "t2.micro"
  subnet_id = "${var.subnets_id}"
  vpc_security_group_ids = "${aws_security_group.ssh.id}"
  key_name = "endpoint"

  tags = {
    Name = "HelloWorld"
  }
}