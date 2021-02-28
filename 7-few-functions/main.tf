


resource "aws_instance" "dev_instance" {

  // us-east-1 example ami
  ami = "ami-0fc61db8544a617ed"
  // us-east-2 example ami
  //ami = "ami-01aab85a5e4a5a0fe"

  instance_type = "t2.micro"

  // using a variable and see if this is taken from .tfvars or not ?

  //availability_zone = var.zone-1
  tags = { Name = "tfvars-example-3"
    project = "demo-variables"
  }
}

variable "try_something_from_main" {

}

