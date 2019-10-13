resource "aws_db_subnet_group" "mariadb-subnet-group" {
  name       = "main"
  subnet_ids = "${var.subnets_id}"

  tags = {
    Name = "My DB subnet group"
    project_name = "${var.project_name}"
    project_env = "${var.project_env}"
    created_with = "terraform"
  }
}


resource "aws_security_group" "mariadb-dev-sg" {
  name = "rds_sg"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
   
  }
}

resource "aws_db_parameter_group" "mariadb-pg" {
  name   = "mariadb-pg"
  family = "mariadb10.1"

  parameter {
    name  = "max_allowed_packet"
    value = "16777216"
  }

}