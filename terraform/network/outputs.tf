output "subnet_id" {
  value = aws_subnet.my_subnet.id
}

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "subnet_cidr" {
  value = aws_subnet.my_subnet.cidr_block
}
