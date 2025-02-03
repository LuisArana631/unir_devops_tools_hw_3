variable "profile" {
  description = "The AWS profile to use."
  type        = string
}

variable "region" {
  description = "The region selected to create the resources in AWS."
  type        = string
}

variable "key_name" {
  description = "The name of the SSH key pair to access instances."
  type        = string
}

variable "availability_zone" {
  description = "The availability zone to launch the instance in."
  type        = string
}