# bastion public
output "bamboo_public_ip" {
  description = "List of IDs of instances"
  value       = aws_instance.bamboo.public_ip
}
