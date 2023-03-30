variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_name" {
  type    = string
  default = "demo_vpc"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "private_subnets" {
  default = {
    "private_subnet_1" = 1
    "private_subnet_2" = 2
    "private_subnet_3" = 3
  }
}

variable "public_subnets" {
  default = {
    "public_subnet_1" = 1
    "public_subnet_2" = 2
    "public_subnet_3" = 3
  }
}

variable "variables_sub_cidr" {
  default     = "10.0.202.0/24"
  description = "CIDR Block for the Variables Subnet"
  type        = string
}

variable "variables_sub_az" {
  default     = "us-east-1a"
  description = "Availability Zone used Variables Subnet"
  type        = string
}

variable "variables_sub_auto_ip" {
  default     = true
  description = "Set Automatic IP Assigment for Variables Subnet"
  type        = bool
}

variable "environment" {
  description = "Environment for deployment"
  type        = string
  default     = "dev"
}


variable "phone_number" {
  type      = string
  sensitive = true
}

/*The first line of defense in TF  is to mark the variable as sensitive 
TF won’t output the value in the TF CLI. 
Note: that this value will still show up in the Terraform state file. 
*/
output "phone_number" {
  value     = var.phone_number
  sensitive = true
}