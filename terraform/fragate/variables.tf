variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "ecs_alb_sg_id" {
  description = "Security Group ID for the ECS/ALB"
  type        = string
}

variable "execution_role_arn" {
  description = "ARN of the ECS execution role"
  type        = string
}

variable "task_role_arn" {
  description = "ARN of the ECS task role"
  type        = string
}

variable "frontend_image" {
  description = "ECR image URI for the frontend"
  type        = string
}

variable "backend_image" {
  description = "ECR image URI for the backend"
  type        = string
}

variable "mongo_uri" {
  description = "Connection string for MongoDB"
  type        = string
}
