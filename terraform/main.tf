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

data "aws_ecr_image" "frontend_image" {
  repository_name = "unir/frontend"
  most_recent     = true
}

data "aws_ecr_image" "backend_image" {
  repository_name = "unir/backend"
  most_recent     = true
}

locals {
  app_secrets    = jsondecode(data.aws_secretsmanager_secret_version.app_secrets_version.secret_string)
  frontend_image = data.aws_ecr_image.frontend_image.image_uri
  backend_image  = data.aws_ecr_image.backend_image.image_uri
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
  ecs_alb_sg_id      = module.network.network_ecs_alb_sg_id
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
resource "aws_lb" "act3" {
  name               = "act3-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [module.network.subnet_id]

  enable_deletion_protection = false
}

resource "aws_lb_target_group" "act3" {
  name     = "act3-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.network.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200-299"
  }
}

resource "aws_lb_listener" "act3" {
  load_balancer_arn = aws_lb.act3.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.act3.arn
  }
}

resource "aws_security_group" "lb_sg" {
  name        = "lb_security_group"
  description = "Security group for Load Balancer"
  vpc_id      = module.network.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}