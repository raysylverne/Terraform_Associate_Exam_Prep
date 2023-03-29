# This is a static output
output "hello-world" {
  description = "Print a Hello World text output"
  value       = "Hello World"
}

# If we created a modul we could use this output block to export the VPC_id to be imported 
# into other modules with resource that need to be attached to the VPC
output "vpc_id" {
  description = "Output the ID for the primary VPC"
  value       = aws_vpc.demo_vpc.id
}

output "public_url" {
  description = "Public URL for our Web Server"
  value       = "https://${aws_instance.web_server.private_ip}:8080/index.html"
}

output "vpc_information" {
  description = "VPC Information about Environment"
  value = "Your ${aws_vpc.demo_vpc.tags.Environment} VPC has an ID of ${aws_vpc
  .demo_vpc.id}"
}

output "public_ip" {
  description = "Public IP for Web Server"
  value       = aws_instance.web_server.public_ip
}