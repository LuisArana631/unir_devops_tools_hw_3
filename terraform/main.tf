provider "aws" {
  region = var.region
  profile = var.profile
}

module "mongodb" {
  source = "./mongodb"
  key_name = var.key_name
}
