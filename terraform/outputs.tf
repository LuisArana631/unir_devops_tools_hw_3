output "public_ips" {
  value = {
    "MongoDB IP" = module.mongodb.mongodb_public_ip
  }
}

output "private_ips" {
  value = {
    "MongoDB IP" = module.mongodb.mongodb_private_ip
  }
}

output "vpc_info" {
  value = {
    "Subnet ID" = module.network.subnet_id
  }
}