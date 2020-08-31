variable "account_id" {
  description = "The ID of the account"
  type        = string
}

variable "account_name" {
  description = "The name of the account"
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block to assign to the VPC"
  type        = string
}

variable "public_subnets" {
  description = "The subnets to create as part of the VPC"
  type = map(object({
    cidr               = string
    availability_zones = list(string)
  }))
}

variable "vpc_flow_logs_publisher_role_arn" {
  description = "The ARN of the IAM Role which will be used to publish VPC Flow Logs"
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
