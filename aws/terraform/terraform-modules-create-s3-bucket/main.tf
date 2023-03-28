# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Terraform configuration

terraform {
  cloud {
    organization = "joncloud"

    workspaces {
      name = "DevOps-for-Life"
    }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.49.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}



module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.vpc_azs
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  enable_nat_gateway = var.vpc_enable_nat_gateway

  tags = var.vpc_tags

  
}

resource "aws_db_subnet_group" "my_db_subnet_group" {
  name        = "my-db-subnet-group"
  description = "My DB subnet group"
  subnet_ids  = module.vpc.private_subnets
  tags = {
    Name = "my-db-subnet-group"
  }
}



module "ec2_instances" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.3.0"

  count = 2
  name  = "my-ec2-cluster-${count.index}"

  ami                    = "ami-0557a15b87f6559cf"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}


module "aurora_devopsforlife_prod" {
  source = "./modules/aurora"
  database_port = 7432
  cluster_name = "devopsforlife-prod-2"
  availability_zones = var.vpc_azs
  db_username = "admin1"
  vpc_name = var.vpc_name
  database_instance_name = "default"
  rds_instance_type = "db.t3.medium"
  db_subnet_group_name = aws_db_subnet_group.my_db_subnet_group.name // use the name of the subnet group created above
}