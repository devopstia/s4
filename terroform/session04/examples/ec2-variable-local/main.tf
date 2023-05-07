resource "aws_instance" "example" {
  ami                    = local.ami
  instance_type          = local.instance_type
  key_name               = local.key_name
  subnet_id              = local.subnet_id
  vpc_security_group_ids = [aws_security_group.example.id]
  tags                   = local.common_tags
  ebs_block_device {
    device_name = "/dev/sdf"
    volume_type = "gp2"
    volume_size = 10
  }
}


