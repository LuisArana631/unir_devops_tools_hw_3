output "subnet_id" {
  value = aws_subnet.my_subnet.id
}

output "subnet_arn" {
  value = aws_subnet.my_subnet.arn
}

output "subnet_cidr" {
  value = aws_subnet.my_subnet.cidr_block
}

output "network_ecs_alb_sg_id" {
  value = aws_security_group.ecs_alb_sg.id

}

output "vpc_id" {
  value = data.aws_vpc.existing_vpc.id
}

output "public_subnets" {
  value = [aws_subnet.my_subnet.id]
}
