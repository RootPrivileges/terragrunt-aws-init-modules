variable "private_subnet_cidr" {
  description = "The private subnet CIDR block"
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the public VPC subnet where the NAT gateway will be held"
  type        = string
}

variable "tags" {
  description = "Tags to apply to created resources"
  type        = map(string)

  default = {}
}

variable "vpc_id" {
  description = "The ID of the account VPC"
  type        = string
}
