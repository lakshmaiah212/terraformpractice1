resource "aws_instance" "web" {
  count = 1
  ami           = "ami-00eb20669e0990cb4"
  instance_type = "t2.micro"
  subnet_id = "${element(var.subnets_id, count.index)}"
  vpc_security_group_ids = ["${aws_security_group.ssh.id}"]
  key_name = "endpoint"

  tags = {
    Name = "webserver"
  }
}