
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

# resource "aws_security_group" "jenkins_sg" {
#   name        = "jenkins_sg"
#   description = "Allow traffic"
#   vpc_id      = "vpc-068852590ea4b093b"

# }

# resource "aws_security_group_rule" "allow_jenkins_22" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = aws_security_group.jenkins_sg.id
# }

# resource "aws_security_group_rule" "allow_jenkins_ping" {
#   type              = "ingress"
#   from_port         = 8
#   to_port           = 0
#   protocol          = "icmp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = aws_security_group.jenkins_sg.id
# }

# resource "aws_security_group_rule" "allow_jenkins_8080" {
#   type              = "ingress"
#   from_port         = 8080
#   to_port           = 8080
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = aws_security_group.jenkins_sg.id
# }

# resource "aws_security_group_rule" "allow_all_outbound_jenkins" {
#   type              = "egress"
#   from_port         = 0
#   to_port           = 0
#   protocol          = "-1"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = aws_security_group.jenkins_sg.id
# }

# resource "aws_security_group" "alb_sg" {
#   name        = "alb_sg"
#   description = "Allow traffic"
#   vpc_id      = "vpc-068852590ea4b093b"
# }

# resource "aws_security_group_rule" "allow_alb_443" {
#   type              = "ingress"
#   from_port         = 443
#   to_port           = 443
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = aws_security_group.alb_sg.id
# }

# resource "aws_security_group_rule" "allow_alb_80" {
#   type              = "ingress"
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = aws_security_group.alb_sg.id
# }

# resource "aws_security_group_rule" "allow_all_outbound_alb" {
#   type              = "egress"
#   from_port         = 0
#   to_port           = 0
#   protocol          = "-1"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = aws_security_group.alb_sg.id
# }


# resource "aws_instance" "my_app_eg1" {
#   for_each = local.web_servers

#   ami           = "ami-0c57a5831a984f2f0"
#   instance_type = each.value.machine_type
#   key_name      = "terraform"
#   subnet_id     = each.value.subnet_id

#   vpc_security_group_ids = [aws_security_group.jenkins_sg.id]

#   tags = {
#     Name = each.key
#   }
# }

# resource "aws_lb_target_group" "my_app_eg1" {
#   name       = "my-app-eg1"
#   port       = 8080
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
#   port             = 8080
# }


# resource "aws_lb" "my_app_eg1" {
#   name               = "my-app-eg1"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.alb_sg.id]

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
#   port              = "443"
#   protocol          = "HTTPS"
#   certificate_arn   = "arn:aws:acm:us-east-1:788210522308:certificate/d2c78623-400f-4434-a7fc-a43a56614f5c"
#   ssl_policy        = "ELBSecurityPolicy-2016-08"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.my_app_eg1.arn
#   }
# }


# resource "aws_lb_listener" "my_app_eg2" {
#   load_balancer_arn = aws_lb.my_app_eg1.arn
#   port              = "80"
#   protocol          = "HTTP"
#   default_action {
#     type = "redirect"

#     redirect {
#       port        = "443"
#       protocol    = "HTTPS"
#       status_code = "HTTP_301"
#     }
#   }
# }


# resource "aws_route53_record" "cluster-alias" {
#   zone_id = "Z09063052B43KCQ7FSGHY"
#   name    = "jenkins"
#   type    = "CNAME"
#   ttl     = "60"
#   records = [aws_lb.my_app_eg1.dns_name]
# }
