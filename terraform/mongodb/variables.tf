variable "key_name" {
  description = "The name of the SSH key pair to access instances."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to launch the instance in."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC to launch the instance in."
  type        = string
}

variable "subnet_cidr" {
  description = "The CIDR block of the subnet to launch the instance in."
  type        = string
}