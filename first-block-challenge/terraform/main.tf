module "vpc" {
  source = "./modules/vpc"

  # Module's variables; commented ones have a default value set.
  # vpc_cdir    = ""
  # subnet_cdir = ""
  vpc_name    = "${var.stack_name}-vpc"
  subnet_name = "${var.stack_name}-vpc-subnet"
}

module "security_group" {
  source = "./modules/security_group"

  # Module's variables; commented ones have a default value set.
  sg_name        = "${var.stack_name}-sg"
  sg_description = "Nuwe Zurich Cloud Hackathon instance SG"
  vpc_id         = module.vpc.id
}

module "ec2" {
  source = "./modules/ec2"

  # Module's variables; commented ones have a default value set.
  # ami               = ""
  # instance_type     = ""
  key_name_1        = ""
  key_name_2        = ""
  subnet_id         = module.vpc.subnet_id
  security_group_id = module.security_group.id
  instance_name     = "${var.stack_name}-ec2"
}
