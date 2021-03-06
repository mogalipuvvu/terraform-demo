provider "aws" {
  region = "us-east-2"
}

module "test_instance-1" {

 source = "git::https://github.com/mogalipuvvu/terraform-demo.git//1-aws-instance"

 }
 module "test_instance-2" {

 source = "git::https://github.com/mogalipuvvu/terraform-demo.git//1-aws-instance"

    project-A-instance-type = "t2.nano"

 }