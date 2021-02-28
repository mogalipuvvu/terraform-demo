terraform {
  backend "s3" {
    bucket = "mana-state-bucket"
    key    = "some-folder1/sub-folder/learn-tf-state"
    region = "us-east-2"
  }
}

provider "aws" {
  //region                  = "us-east-2"
  region                          = var.test-region
  clearcleshared_credentials_file = "/Users/srini/.aws/credentials"
  profile                         = "learning-tf"
}


