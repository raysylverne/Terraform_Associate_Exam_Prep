#A good use case for version constraints would be if a Terraform update made massive changes 
#to their syntax that could break your code 
terraform {
  backend "s3" {
    bucket = "terrraform-raysylverne"
    key    = "prod/aws_infra"
    region = "us-east-1"
  }

  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "2.1.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.4.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "3.1.0"
    }
  }
}