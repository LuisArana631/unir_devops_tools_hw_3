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
