provider "aws"{
  region                  =  var.tirumala-region
  shared_credentials_file = "/Users/srini/.aws/credentials"
  profile                 = "learning-tf"
}

variable "project-A-instance-type" {
  type = string
  default = "t2.micro"

}

resource "aws_instance" "ab111111" {
  ami = var.t-ami-id             
  instance_type               = var.project-A-instance-type
  availability_zone = var.t-az-1
  count = 2
 tags = {
    Name = "nalini-rajani-example-2"
  }
}

// we are creating an S3 bucket

//resource "aws_s3_bucket" "some-bucket" {



//}

//output "instance_ips" {
//  value = aws_instance.ab111111.public_ip
//}

//output "my_private_ip" {
//  value = aws_instance.ab111111.private_ip
//}

//output "my_subnet_id" {
//  value = aws_instance.ab111111.subnet_id
//}

//output "my-bucket" {
// value = aws_s3_bucket.some-bucket.arn
//}

