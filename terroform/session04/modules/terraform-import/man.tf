
resource "aws_instance" "example" {
  ami                    = var.aws_ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.vpc_security_group_ids[0]]
  ebs_block_device {
    device_name = "/dev/sdf"
    volume_type = "gp2"
    volume_size = 30
  }
  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-bastion-host-local", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
    },
  )
}
