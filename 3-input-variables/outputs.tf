
output "dev-public-ip" {
  value = aws_instance.dev_instance.public_ip
}
output "arn-value" {
  value = aws_instance.dev_instance.arn
} 