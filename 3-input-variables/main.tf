


resource "aws_instance" "dev_instance" {
  ami = "ami-01aab85a5e4a5a0fe"
  instance_type               = "t2.micro"
  availability_zone = var.zone-1
  tags = {
    Name = "state-example-5"
    project = "demo-backend"
  }
}

variable "try_something_from_main" {

  
}

