variable "ami" {}
variable "size" {
  default = "t2.micro"
}
variable "subnet_id" {}
variable "security_groups" {
  type = list(any)
}
resource "aws_instance" "web_server_module" {
  ami                    = var.ami
  instance_type          = var.size
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_groups
  tags = {
    "Name"        = "Server from Module"
    "Environment" = "Training"
  }

}

output "public_ip" {
  value = aws_instance.web_server_module.public_ip
}
output "public_dns" {
  value = aws_instance.web_server_module.public_dns
}