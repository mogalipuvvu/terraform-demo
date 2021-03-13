
provider "aws" {
  region = "us-east-2"
}

###  Create IAM user ###

module "iam_example_iam-user" {
  source  = "terraform-aws-modules/iam/aws//examples/iam-user"
  version = "3.12.0"
}