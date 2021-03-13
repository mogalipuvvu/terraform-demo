#  for-each

provider "aws" {
  region = "us-east-2"
}

variable "vpc_id" {
  
  default = "vpc-02e77512efa577940"
}

data "aws_ami" "example_ami" {
    owners = [ "self" ]
}

# data "aws_vpc" "sample_vpc" {
#   id = var.vpc_id
# }

#  list of all subnet-ids
data "aws_subnet_ids" "subnet-id-list" {
  vpc_id = var.vpc_id
}


resource "aws_instance" "multiple_servers" {
    ami = data.aws_ami.example_ami.id
    instance_type = "t2.micro"

    for_each =  data.aws_subnet_ids.subnet-id-list.ids
    subnet_id = each.key

    tags = {
      "Name" = each.key 
    }
}




