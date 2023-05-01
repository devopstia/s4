resource "aws_instance" "example" {
  ami           = "ami-0557a15b87f6559cf"
  instance_type = var.instance_type[0]
  key_name      = var.key_name

  tags = {
    Name = "web"
  }
}


