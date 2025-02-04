provider "aws" {
  region  = var.aws_region
  profile = var.profile
}

module "mongodb" {
  source      = "./mongodb"
  key_name    = var.key_name
  subnet_id   = module.network.subnet_id
  vpc_id      = module.network.vpc_id
  subnet_cidr = module.network.subnet_cidr
}

module "network" {
  source            = "./network"
  public_subnets    = var.public_subnets
  availability_zone = var.availability_zone
}

module "fargate" {
  source             = "./fargate"
  vpc_id             = module.network.vpc_id
  public_subnets     = module.network.public_subnets
  ecs_alb_sg_id      = module.network.ecs_alb_sg_id
  execution_role_arn = var.execution_role_arn
  task_role_arn      = var.task_role_arn
  frontend_image     = var.frontend_image
  backend_image      = var.backend_image
  mongo_uri          = var.mongo_uri
}
