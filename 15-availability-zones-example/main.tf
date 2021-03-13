
provider "aws" {
  region = "us-east-2"
}


terraform {
  backend "s3" {}
}


# Declare the data source
data "aws_availability_zones" "demo_available" {
  state = "available"
}

module "demo_vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "sample_zones_vpc"
  cidr = "10.0.0.0/16"
}


#Create subnets in the FIRST TWO  availability zones

resource "aws_subnet" "public_subnet_1" {
  cidr_block = cidrsubnet("10.0.0.0/16", 4, 0)
  vpc_id = module.demo_vpc.vpc_id
  availability_zone = data.aws_availability_zones.demo_available.names[0]
  tags = {
    "Name" = "Subnet-PUBLIC"
  }
}

resource "aws_subnet" "private_subnet_2" {
  cidr_block = cidrsubnet("10.0.0.0/16", 4, 1)
  vpc_id = module.demo_vpc.vpc_id
  availability_zone = data.aws_availability_zones.demo_available.names[1]
  tags = {
    "Name" = "Subnet-PRIVATE-2"
  }
}

resource "aws_subnet" "private_subnet_3" {
  cidr_block = cidrsubnet("10.0.0.0/16", 4, 2)
  vpc_id = module.demo_vpc.vpc_id
  availability_zone = data.aws_availability_zones.demo_available.names[2]
   tags = {
    "Name" = "Subnet-PRIVATE-3"
  }
}

