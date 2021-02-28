
// this variable is used to create ec2-instance in a zone
variable "zone-1" {
  type    = string
  default = "us-east-2c"
}

// Just tryinig to see how this will be applied at runtime 
variable "something_not_used" {
  type = string
}

variable "zone-2" {
  type    = string
  default = "us-east-2a"
}

variable "zone-3" {
  type    = string
  default = "us-east-2c"
}
variable "test-region" {
  type    = string
  default = "us-east-2"
}