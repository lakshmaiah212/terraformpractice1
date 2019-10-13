resource "aws_instance" "web" {
  count = 1
  ami           = "ami-0b69ea66ff7391e80"
  instance_type = "t2.micro"
  subnet_id = "${element(var.subnets_id, count.index)}"
  vpc_security_group_ids = ["${aws_security_group.ssh.id}"]
  key_name = "endpoint"

  tags = {
    Name = "web"
    project_name = "${var.project_name}"
    project_env = "${var.project_env}"
  }
}