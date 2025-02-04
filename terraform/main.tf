provider "aws" {
  region  = var.aws_region
  profile = var.profile
}

data "aws_secretsmanager_secret" "app_secrets" {
  name = "my-app-secrets"
}

data "aws_secretsmanager_secret_version" "app_secrets_version" {
  secret_id = data.aws_secretsmanager_secret.app_secrets.id
}

data "aws_ecr_image" "unir/forntend_image" {
  repository_name = "unir/frontend"
  most_recent     = true
}

data "aws_ecr_image" "unir/backend_image" {
  repository_name = "unir/backend"
  most_recent     = true
}


locals {
  app_secrets    = jsondecode(data.aws_secretsmanager_secret_version.app_secrets_version.secret_string)
  frontend_image = data.aws_ecr_image["unir/frontend_image"].image_uri
  backend_image  = data.aws_ecr_image["unir/backend_image"].image_uri
}

module "network" {
  source            = "./network"
  vpc_id            = var.vpc_id
  availability_zone = var.availability_zone
}

module "fargate" {
  source             = "./fargate"
  vpc_id             = module.network.vpc_id
  public_subnets     = module.network.public_subnets
  ecs_alb_sg_id      = module.network.ecs_alb_sg_id
  execution_role_arn = var.execution_role_arn
  task_role_arn      = var.task_role_arn
  frontend_image     = local.frontend_image
  backend_image      = local.backend_image
  mongo_uri          = module.mongodb.mongo_uri
}

module "mongodb" {
  source      = "./mongodb"
  key_name    = var.key_name
  subnet_id   = module.network.subnet_id
  vpc_id      = module.network.vpc_id
  subnet_cidr = module.network.subnet_cidr
}
