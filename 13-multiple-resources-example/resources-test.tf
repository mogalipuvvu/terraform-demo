
/*
To see if we can use same VPC id during the creation time

---  First create VPC
---  Then create Subnet

*/

provider "aws" {
  region                  = "us-east-2"
  shared_credentials_file = "/Users/srini/.aws/credentials"
  profile                 = "learning-tf"

}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    name = "testing-name"
    Name = "testing-123"
    
  }
}

resource "aws_subnet" "my_public_subnet" {
  cidr_block = cidrsubnet(aws_vpc.my_vpc.cidr_block, 8,0)
  vpc_id = aws_vpc.my_vpc.id
  availability_zone = "us-east-2a"
  tags = {
    "Name" = "public-subnet-123"
  }
  depends_on = [ 
    aws_vpc.my_vpc
   ]
}

resource "aws_subnet" "my_private_subnet" {
  
  cidr_block = cidrsubnet(aws_vpc.my_vpc.cidr_block, 8,1)
  # cidr_block = cidrsubnet(data.aws_vpc.try_vpc.cidr_block, 4,3  )

  vpc_id = aws_vpc.my_vpc.id
  availability_zone = "us-east-2a"
  tags = {
    "Name" = "private-subnet-1"
  }
  depends_on = [ 
    aws_vpc.my_vpc
   ]
}



module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "nalini-vpc-from-module"
  cidr = "10.0.0.0/16"
}