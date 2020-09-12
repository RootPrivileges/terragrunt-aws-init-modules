resource "aws_security_group" "aws_endpoints" {
  name        = "aws_endpoints"
  description = "Security group for AWS endpoints"
  vpc_id      = var.vpc_id
}
