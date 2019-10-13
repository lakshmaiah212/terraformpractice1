module "vpc" {
  source = "./vpc"
  vpc_cidr = "${var.vpc_cidr}"
  project_name = "${var.project_name}"
  project_env = "${var.project_env}"
  
}

module "ec2" {
  source = "./ec2"
  vpc_id = "${module.vpc.vpc_id}"
  subnets_id = "${module.vpc.subnets_id}"
  project_name = "${var.project_name}"
  project_env = "${var.project_env}"
  
}
