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

/*
variable "phone_number" {
  type      = string
  sensitive = true
}

The first line of defense in TF  is to mark the variable as sensitive 
TF won’t output the value in the TF CLI. 
Note: that this value will still show up in the Terraform state file. 

output "phone_number" {
  value     = var.phone_number
  sensitive = true
}
*/

# list variables need to be ref using index []
variable "us-east-1-azs" {
  type = list(string) # Adding the type is not required Terraform auto detects the type
  default = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c",
    "us-east-1d",
    "us-east-1e"
  ]
}

variable "environment" {
  description = "Environment for deployment"
  type        = string
  default     = "dev"
}

variable "ip" {
  type = map(string)
  default = {
    prod = "10.0.150.0/24"
    dev  = "10.0.250.0/24"
  }
}

# Use a Complex map variable to group information to simplify readability
variable "env" {
  type = map(any)
  default = {
    prod = {
      ip = "10.0.150.0/24"
      az = "us-east-1a"
    }
    dev = {
      ip = "10.0.250.0/24"
      az = "us-east-1e"
    }
  }
}

variable "num_1" {
  type        = number
  description = "Numbers for function labs"
  default     = 88
}
variable "num_2" {
  type        = number
  description = "Numbers for function labs"
  default     = 73
}
variable "num_3" {
  type        = number
  description = "Numbers for function labs"
  default     = 52
}

variable "web_ingress" {
  type = map(object(
    {
      description = string
      port        = number
      protocol    = string
      cidr_blocks = list(string)
    }
  ))
  default = {
    "80" = {
      description = "Port 80"
      port        = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    "443" = {
      description = "Port 443"
      port        = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}