provider "aws" {
  region = var.region
  profile = var.profile
}

module "network" {
  source = "./network"
  availability_zone = var.availability_zone
}

module "mongodb" {
  source = "./mongodb"
  key_name = var.key_name
  subnet_id = module.network.subnet_id
  vpc_id = module.network.vpc_id
  subnet_cidr = module.network.subnet_cidr
}
