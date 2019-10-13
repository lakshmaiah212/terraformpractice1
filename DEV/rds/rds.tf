resource "aws_db_instance" "dev-rds" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mariadb"
  engine_version       = "10.3"
  instance_class       = "db.t2.micro"
  name                 = "studentapp"
  username             = "student"
  password             = "student1"
  skip_final_snapshot = true
  parameter_group_name = "${aws_db_parameter_group.mariadb-pg.name}"
  db_subnet_group_name = "${aws_db_subnet_group.mariadb-subnet-group.name}"
  identifier = "studentapp-rds-dev"
  vpc_security_group_ids = ["${aws_db_security_group.mariadb-dev-sg.id}"]
}