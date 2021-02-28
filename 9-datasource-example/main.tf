

data "aws_vpc" "try_vpc"  { 
  id = var.projectA_vpc_id
}


resource "aws_subnet" "projectA_public_net" {

vpc_id = data.aws_vpc.try_vpc.id
//cidrsubnet(cidr_block,newbits, netnum )
cidr_block = cidrsubnet(data.aws_vpc.try_vpc.cidr_block, 4,3  )
availability_zone = "us-east-2c"
  
}

data "aws_ami" "existing_ami" {
   owners = ["self"]
   most_recent = true

}

resource "aws_instance" "name" {

  ami = data.aws_ami.existing_ami.id
  instance_type = "t2.micro"
}  