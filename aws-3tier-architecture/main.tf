
provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source             = "terraform-aws-modules/vpc/aws"
  version            = "2.66.0"
  name               = "vpc_name"
  cidr               = "10.0.0.0/16"
  azs                = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnets    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  enable_nat_gateway = true
  enable_vpn_gateway = false
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "ec2_instance" {
  source              = "terraform-aws-modules/ec2-instance/aws"
  version             = "4.3.0"
  name                = "ec2_instance_name"
  count               = 2
  ami                 = "ami-0c55b159cbfafe1f0"
  instance_type       = "t2.micro"
  subnet_id           = module.vpc.private_subnets[0]
  associate_public_ip = true
  security_groups     = [module.security_group.this_security_group_id]
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "security_group" {
  source      = "terraform-aws-modules/security-group/aws"
  version     = "4.1.0"
  name        = "security_group_name"
  description = "Security group for EC2 instance"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_rules            = ["all-all"]
  ingress_with_self        = false
  egress_rules             = ["all-all"]
  egress_with_source_group = false
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "alb" {
  source          = "terraform-aws-modules/alb/aws"
  version           = "~> 8.0"
 load_balancer_name = "my-load-balancer"
  subnets         = module.vpc.public_subnets
  security_groups = [module.security_group.this_security_group_id]
  vpc_id          =  module.vpc.vpc_id
  
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "rds" {
  source     = "terraform-aws-modules/rds/aws"
  version    = "3.0.0"
  name       = "rds_name"
  db_name    = "mydb"
  engine     = "mysql"
  username   = "admin"
  password   = "password"
  port       = "3306"
  subnet_ids = module.vpc.private_subnets
  vpc_id     = module.vpc.vpc_id
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "asg" {
  source             = "terraform-aws-modules/autoscaling/aws"
  version            = "4.2.0"
  name               = "asg_name"
  subnets            = module.vpc.private_subnets
  launch_template_id = module.ec2_instance.launch_template_id
  target_group_arns  = [module.alb.target_group_arn]
  desired_capacity   = 2
  min_size           = 2
  max_size           = 4
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
