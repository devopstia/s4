
resource "aws_instance" "example" {
  ami                    = var.ami["ami_1"]
  instance_type          = var.instance_type
  key_name               = var.key_name[0]
  subnet_id              = var.subnet_id[1]
  vpc_security_group_ids = [var.vpc_security_group_ids["vpc_security_group_id_1"]]
  tags                   = var.common_tags
  ebs_block_device {
    device_name = "/dev/sdf"
    volume_type = "gp2"
    volume_size = 10
  }
}

resource "aws_instance" "example2" {
  ami                    = var.ami["ami_2"]
  instance_type          = var.instance_type
  key_name               = var.key_name[1]
  subnet_id              = var.subnet_id[2]
  vpc_security_group_ids = [var.vpc_security_group_ids["vpc_security_group_id_2"]]
  tags                   = var.common_tags
  ebs_block_device {
    device_name = "/dev/sdf"
    volume_type = "gp2"
    volume_size = 10
  }
}
