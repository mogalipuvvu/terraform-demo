

provider "aws" {
  region = "us-east-2"
}

# create a dynamoDB table to maintain the locks

resource "aws_dynamodb_table" "tf-db-lock" {
  name           = "terraform_lock_table"
  billing_mode   = "PROVISIONED"
  read_capacity  = 3
  write_capacity = 3
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

terraform {
  backend "s3" {
    bucket = "mana-state-bucket"
    key    = "lock-example/state-lock-demo"
    region = "us-east-2"
    dynamodb_table="terraform_lock_table"
  }
}


module "test-iam-user" {
  source  = "terraform-aws-modules/iam/aws//examples/iam-user"
  version = "3.12.0"
}