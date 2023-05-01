module "ec2_cluster" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name           = "web"
  instance_count = 1

  ami           = data.aws_ami.amzlinux.id
  instance_type = "t2.micro"
  key_name      = "jenkins-key"
  # monitoring             = true
  vpc_security_group_ids = ["vpc-068852590ea4b093b"]
  subnet_id              = "subnet-05f285a35173783b0"
  user_data              = file("${path.module}/bamboo-user-data/bamboo-user-data.sh")

  tags = {
    Name        = "dev-web-server"
    Owner       = "SRP"
    Access-ID   = "2645"
    Project     = "srp"
    Environment = "dev"
    Create_By   = "Terraform"
  }
}

