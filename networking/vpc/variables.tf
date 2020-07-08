variable "account_name" {
  description = "The name of the account"
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block to assign to the VPC"
  type        = string
}

variable "tfstate_global_bucket" {
  description = "The S3 bucket that holds Terraform state"
  type        = string
}

variable "tfstate_global_bucket_region" {
  description = "The region of the S3 bucket that holds Terraform state"
  type        = string
}

variable "vpc_log_group_name" {
  description = "The name of CloudWatch Logs group to which VPC Flow Logs are delivered"
  type        = string

  default = "vpc-flow-logs"
}

variable "vpc_log_retention_in_days" {
  description = "The length of time to retain VPC flow logs, in days"
  type        = number

  default = 365
}
