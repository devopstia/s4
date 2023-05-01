
## Local variables blocks

locals {
  instance_type = "t2.micro"
  vpc_id        = "vpc-068852590ea4b093b"
  subnet_id_a   = "subnet-096d45c28d9fb4c14"
  subnet_id_b   = "subnet-05f285a35173783b0"
  subnet_id_c   = "subnet-0cf0e3c5a513134bd"
  subnet_id_d   = "subnet-0df29b31a59072845"
  tags = {
    Name        = "dev-web-server"
    Owner       = "SRP"
    Access-ID   = "2645"
    Project     = "srp"
    Environment = "dev"
    Create_By   = "Terraform"
  }
}

# Resource Block
resource "aws_instance" "bamboo" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = local.instance_type
  user_data     = file("${path.module}/bamboo-user-data/bamboo-user-data.sh")
  key_name      = "jenkins-key"
  subnet_id     = local.subnet_id_a

  tags = var.tags
}

# Resource Block
resource "aws_eip" "bamboo_eip" {
  depends_on = [aws_instance.bamboo]
  instance   = aws_instance.bamboo.id
  vpc        = true
  tags       = local.tags
}

# Resource Block
resource "aws_eip" "bamboo_eip2" {
  vpc = true
  tags = {
    Name        = "dev-web-server"
    Owner       = "SRP"
    Access-ID   = "2645"
    Project     = "srp"
    Environment = "dev"
    Create_By   = "Terraform"
  }
}

## Null resource block
resource "null_resource" "copy_ec2_keys" {
  depends_on = [aws_instance.bamboo]
  connection {
    type        = "ssh"
    host        = aws_eip.bamboo_eip.public_ip
    user        = "ubuntu"
    password    = ""
    private_key = file("private-key/terraform-key.pem")
  }

  ## provisioner block
  provisioner "file" {
    source      = "bamboo-user-data/bamboo-user-data.sh"
    destination = "/tmp/bamboo-user-data.sh"
  }

  ## provisioner block
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/bamboo-user-data.sh",
      "sudo bash /tmp/bamboo-user-data.sh"
    ]
  }
}
