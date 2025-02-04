variable "availability_zone" {
  description = "The availability zone to launch the instance in."
  type        = string
}
variable "public_subnets" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}
