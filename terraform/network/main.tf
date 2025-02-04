resource "aws_vpc" "existing_vpc" {
  id = var.vpc_id
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.existing_vpc.id
  availability_zone = var.availability_zone
  tags = {
    Name = "MyUnirSubnet"
  }
}
resource "aws_security_group" "ecs_alb_sg" {
  name        = "ecs-alb-sg"
  description = "SG for ECS tasks and ALB"
  vpc_id      = aws_vpc.existing_vpc.id

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
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

resource "aws_security_group" "mongo_sg" {
  name        = "mongo-sg"
  description = "Security group for MongoDB instance"
  vpc_id      = aws_vpc.existing_vpc.id

  ingress {
    description = "MongoDB access"
    from_port   = 27017
    to_port     = 27017
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
