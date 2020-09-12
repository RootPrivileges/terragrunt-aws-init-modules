variable "acl_rule_number" {
  description = "The ACL rule number for the new subnet"
  type        = number

  default = 0
}

variable "availability_zone" {
  description = "The Availability Zone to create the subnet in"
  type        = string
}

variable "create_nat_gateway" {
  description = "Flag to control creation of NAT gateway inside subnet"
  type        = bool

  default = false
}

variable "environment" {
  description = "The name of the environment holding the subnet"
  type        = string
}

variable "public_subnet_acl_id" {
  description = "The ID of the public subnet network ACL"
  type        = string
}

variable "public_subnet_acl_rule_number" {
  description = "The ACL rule number for the public subnet"
  type        = number

  default = 0
}

variable "public_subnet_cidr_block" {
  description = "The CIDR of the public subnet to create bi-directional network ACLs with"
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the public subnet"
  type        = string
}

variable "public_subnet_name" {
  description = "The name of the public subnet"
  type        = string
}

variable "subnet_cidr" {
  description = "The intended CIDR range of the subnet"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "tags" {
  description = "Tags to apply to created resources"
  type        = map(string)

  default = {}
}

variable "tgw_attachment" {
  description = "Will this subnet have a Transit Gateway attachment"
  type        = bool
}

variable "vpc_id" {
  description = "The ID of the account VPC"
  type        = string
}
