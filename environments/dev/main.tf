provider "aws" {
  region = var.region
}

module "ec2" {
  source = "../../modules/ec2"

  ami_id        = var.ami_id
  instance_type = var.instance_type
  ec2_name = var.ec2_name
  subnet_id = module.vpc.subnet_id
  vpc_id    = module.vpc.vpc_id
}

module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
}
