# EC2 Instance
resource "aws_instance" "bastion" {
  ami           = data.aws_ami.ubuntu_20_04.id
  instance_type = "t2.micro"
  #   user_data              = file("${path.module}/bastion-user-data/bastion-host-user-data.sh")
  key_name               = "terraform"
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  subnet_id              = var.subnet_id
  tags = {
    "Name" = "bastion-host"
  }
}

# Create Elastic IP for Bastion Host
resource "aws_eip" "bastion_eip" {
  instance = aws_instance.bastion.id
  vpc      = true
  tags = {
    "Name" = "Bastion Pulic IP"
  }
}

# Create a Null Resource and Provisioners
resource "null_resource" "copy_ec2_keys" {
  # depends_on = [aws_instance.bastion]
  connection {
    type        = "ssh"
    host        = aws_eip.bastion_eip.public_ip
    user        = "ubuntu"
    password    = ""
    private_key = file("C:\\Users\\Tia\\Downloads\\terraform.pem")
  }

  provisioner "file" {
    source      = "./bastion-user-data/bastion-host-user-data.sh"
    destination = "/tmp/bastion-host-user-data.sh"
  }

  provisioner "file" {
    source      = "docker/Dockerfile"
    destination = "/tmp/Dockerfile"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/bastion-host-user-data.sh",
      "sudo bash /tmp/bastion-host-user-data.sh",
      "cd /tmp",
      "sudo docker build -t devopseasylearning2021/s5tia:microservice .",
      "sudo docker run -d -p 8090:80 --name microservice devopseasylearning2021/s5tia:microservice",
      "sudo docker ps -a",
    ]
  }
}

