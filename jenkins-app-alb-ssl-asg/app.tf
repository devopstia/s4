
# provider "aws" {
#   region = "us-east-1"
# }

# locals {
#   web_servers = {
#     my-app-00 = {
#       machine_type = "t2.micro"
#       subnet_id    = "subnet-096d45c28d9fb4c14"
#     }
#     my-app-01 = {
#       machine_type = "t2.micro"
#       subnet_id    = "subnet-0cf0e3c5a513134bd"
#     }
#   }
# }


# resource "aws_security_group" "ec2_eg1" {
#   name   = "ec2-eg1"
#   vpc_id = "vpc-068852590ea4b093b"
# }

# resource "aws_security_group" "alb_eg1" {
#   name   = "alb-eg1"
#   vpc_id = "vpc-068852590ea4b093b"
# }

# resource "aws_security_group_rule" "ingress_ec2_traffic" {
#   type                     = "ingress"
#   from_port                = 8080
#   to_port                  = 8080
#   protocol                 = "tcp"
#   security_group_id        = aws_security_group.ec2_eg1.id
#   source_security_group_id = aws_security_group.alb_eg1.id
# }

# resource "aws_security_group_rule" "ingress_ec2_health_check" {
#   type                     = "ingress"
#   from_port                = 80
#   to_port                  = 80
#   protocol                 = "tcp"
#   security_group_id        = aws_security_group.ec2_eg1.id
#   source_security_group_id = aws_security_group.alb_eg1.id
# }

# resource "aws_security_group_rule" "full_egress_ec2" {
#   type              = "egress"
#   from_port         = 0
#   to_port           = 0
#   protocol          = "-1"
#   security_group_id = aws_security_group.ec2_eg1.id
#   cidr_blocks       = ["0.0.0.0/0"]
# }

# resource "aws_security_group_rule" "ingress_alb_traffic" {
#   type              = "ingress"
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
#   security_group_id = aws_security_group.alb_eg1.id
#   cidr_blocks       = ["0.0.0.0/0"]
# }

# resource "aws_security_group_rule" "egress_alb_traffic" {
#   type                     = "egress"
#   from_port                = 8080
#   to_port                  = 8080
#   protocol                 = "tcp"
#   security_group_id        = aws_security_group.alb_eg1.id
#   source_security_group_id = aws_security_group.ec2_eg1.id
# }

# resource "aws_security_group_rule" "egress_alb_health_check" {
#   type                     = "egress"
#   from_port                = 80
#   to_port                  = 80
#   protocol                 = "tcp"
#   security_group_id        = aws_security_group.alb_eg1.id
#   source_security_group_id = aws_security_group.ec2_eg1.id
# }


# resource "aws_instance" "my_app_eg1" {
#   for_each = local.web_servers

#   ami           = "ami-0c57a5831a984f2f0"
#   instance_type = each.value.machine_type
#   key_name      = "terraform"
#   subnet_id     = each.value.subnet_id

#   vpc_security_group_ids = [aws_security_group.ec2_eg1.id]

#   tags = {
#     Name = each.key
#   }
# }

# resource "aws_lb_target_group" "my_app_eg1" {
#   name       = "my-app-eg1"
#   port       = 80
#   protocol   = "HTTP"
#   vpc_id     = "vpc-068852590ea4b093b"
#   slow_start = 0

#   load_balancing_algorithm_type = "round_robin"

#   stickiness {
#     enabled = false
#     type    = "lb_cookie"
#   }

#   health_check {
#     enabled             = true
#     port                = 80
#     interval            = 30
#     protocol            = "HTTP"
#     path                = "/index.html"
#     matcher             = "200"
#     healthy_threshold   = 3
#     unhealthy_threshold = 3
#   }
# }

# resource "aws_lb_target_group_attachment" "my_app_eg1" {
#   for_each = aws_instance.my_app_eg1

#   target_group_arn = aws_lb_target_group.my_app_eg1.arn
#   target_id        = each.value.id
#   port             = 80
# }


# resource "aws_lb" "my_app_eg1" {
#   name               = "my-app-eg1"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.alb_eg1.id]

#   # access_logs {
#   #   bucket  = "my-logs"
#   #   prefix  = "my-app-lb"
#   #   enabled = true
#   # }

#   subnets = [
#     "subnet-096d45c28d9fb4c14",
#     "subnet-0cf0e3c5a513134bd"
#   ]
# }


# resource "aws_lb_listener" "http_eg1" {
#   load_balancer_arn = aws_lb.my_app_eg1.arn
#   port              = "80"
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.my_app_eg1.arn
#   }
# }
