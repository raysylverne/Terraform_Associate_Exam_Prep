#A good use case for version constraints would be if a Terraform update made massive changes 
#to their syntax that could break your code 

terraform {
  required_version = ">= 1.0.0"
}