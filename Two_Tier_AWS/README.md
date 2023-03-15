# Deploying a Two-Tier Architecture in AWS using Terraform

This repository contains the code for deploying a basic two-tier architecture in AWS using Terraform.

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