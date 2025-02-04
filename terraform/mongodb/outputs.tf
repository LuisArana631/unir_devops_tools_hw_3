output "mongodb_public_ip" {
  value = aws_instance.mongodb.public_ip
}

output "mongodb_private_ip" {
  value = aws_instance.mongodb.private_ip
}

output "mongo_uri" {
  value = "mongodb://${aws_instance.mongodb.private_ip}:27017"
}
