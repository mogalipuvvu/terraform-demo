
terraform {
  backend "s3" {
    bucket = "mana-state-bucket"
    key = "workspace-demo/env-example-tf-state"
    region = "us-east-2"
 }
} 

provider "aws" {
 region                  = "us-east-2"
  shared_credentials_file = "/Users/srini/.aws/credentials"
  profile                 = "learning-tf"
}

resource "aws_instance" "dev_instance" {
  ami = "ami-01aab85a5e4a5a0fe"
  instance_type               = "t2.micro"
  tags = {
    Name = "workspace-example-10"
    project = "demo-workspace-backend"
  }
}

output "dev-public-ip" {
  value = aws_instance.dev_instance.public_ip
}
output "arn-value" {
  value = aws_instance.dev_instance.arn
} 
