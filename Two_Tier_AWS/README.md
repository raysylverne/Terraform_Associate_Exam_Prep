# Deploying a Two-Tier Architecture in AWS using Terraform

This repository contains the code for deploying a basic two-tier architecture in AWS using Terraform.
![Screenshot 2023-03-15 at 3 56 14 PM](https://user-images.githubusercontent.com/111945210/225427715-579224dd-07ea-49a3-9887-8f3833fc8231.png)



## Architecture Overview

The architecture consists of the following components:

- A VPC with two public and two private subnets
- An internet gateway for the public subnets
- NAT gateways for the private subnets

## Prerequisites

Before deploying the architecture, you will need:

- An AWS account
- Terraform installed on your machine
- AWS CLI installed on your machine

## Deployment

To deploy the architecture, follow these steps:

1. Clone this repository to your local machine.
2. Navigate to the `Two_Tier_AWS` directory.
3. Run `terraform init` to initialize the Terraform configuration.
4. Run `terraform plan` to see the changes that will be made.
5. Run `terraform apply` to apply the changes and deploy the architecture.

# HashiCorp Configuration Language Breakdown

```
<BLOCK TYPE> "<BLOCK LABEL>" "<BLOCK LABEL>" {
    # Block body
    <IDENTIFIER> = <EXPRESSION> # Argument
}

```

## AWS EC2 Example

```
resource "aws_instance" "web_server" {
  ami = "ami-04d29b6f966df1537"
  instance_type = var.instance_type
}

```

This is a template for a block in Terraform configuration files. The example provided shows the configuration for an AWS EC2 instance resource. The `aws_instance` resource creates an EC2 instance in the specified AWS region.