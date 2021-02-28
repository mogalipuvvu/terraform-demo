provider "aws"{
  region                  =  "us-east-2"
  shared_credentials_file = "/Users/srini/.aws/credentials"
  profile                 = "learning-tf"
}

variable "project-A-instance-type" {
  type = string
  default = "t2.micro"

}

resource "aws_instance" "ab111111" {
  ami = "ami-09246ddb00c7c4fef"             
  instance_type               = var.project-A-instance-type
 tags = {
    Name = "nalini-rajani-example-1"
  }
}
