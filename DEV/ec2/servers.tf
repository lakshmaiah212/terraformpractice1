resource "aws_instance" "webserver" {
  count = 1
  ami           = "ami-0b69ea66ff7391e80"
  instance_type = "t2.micro"
  key_name = "endpoint"
  subnet_id = "${element(var.subnets_id,count.index)}"
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  associate_public_ip_address = true

  tags = {
    Name = "webserver"
    project_name = "${var.project_name}"
    project_env = "${var.project_env}"
  }
}