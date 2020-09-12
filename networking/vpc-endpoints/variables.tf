variable "account_id" {
  description = "The ID of the account"
  type        = string
}

variable "enable_ec2_endpoint" {
  description = "Control creation of the EC2 VPC Interface endpoint"
  type        = bool

  default = false
}

variable "enable_ec2messages_endpoint" {
  description = "Control creation of the EC2Messages VPC Interface endpoint"
  type        = bool

  default = false
}

variable "enable_s3_endpoint" {
  description = "Control creation of the S3 VPC Gateway endpoint"
  type        = bool

  default = false
}

variable "enable_ssm_endpoint" {
  description = "Control creation of the SSM VPC Interface endpoint"
  type        = bool

  default = false
}

variable "enable_ssmmessages_endpoint" {
  description = "Control creation of the SSMMessages VPC Interface endpoint"
  type        = bool

  default = false
}

variable "environment" {
  description = "The name of the environment hosting the VPC endpoints"
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs to attach to VPC endpoints to"
  type        = list(string)
}

variable "vpc_id" {
  description = "The VPC to create the subnet in"
  type        = string
}
