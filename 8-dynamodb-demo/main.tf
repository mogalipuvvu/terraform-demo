
// Trying to create a DynamoDB table

resource "aws_dynamodb_table" "test_dyno_table" {

  name = "learning-dyno-table"
  billing_mode = "PAY_PER_REQUEST"

 
  # read_capacity = 25
  # write_capacity = 10

  hash_key = "learner-id"
  attribute {
    name = "learner-id"
    type = "S"
  }

}
