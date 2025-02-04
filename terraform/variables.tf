variable "profile" {
  description = "The AWS profile to use."
  type        = string
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}
variable "public_subnets" {
  description = "List of public subnet CIDRs (or IDs if pre-existing)"
  type        = list(string)
}

variable "availability_zone" {
  description = "Availability zone for the subnets"
  type        = string
  default     = "us-east-1"
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
  description = "Connection string for MongoDB (used by the backend)"
  type        = string
}

variable "mongo_ami" {
  description = "AMI ID for the MongoDB instance"
  type        = string
}

variable "mongo_instance_type" {
  description = "Instance type for MongoDB"
  type        = string
}

variable "key_name" {
  description = "Name of the SSH keypair to use"
  type        = string
}
