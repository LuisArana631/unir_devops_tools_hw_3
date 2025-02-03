resource "aws_instance" "mongodb" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"
  key_name      = var.key_name
  
  user_data = file("${path.module}/setup.sh")

  security_groups = [aws_security_group.mongodb_sg.name]

  tags = {
    Name = "MongoDB Server"
  }
}
