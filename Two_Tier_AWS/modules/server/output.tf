output "public_ip" {
  value = aws_instance.web_server_module.public_ip
}
output "public_dns" {
  value = aws_instance.web_server_module.public_dns
}

output "size" {
  description = "Size of server built with Server Module"
  value       = aws_instance.web_server_module.instance_type
}