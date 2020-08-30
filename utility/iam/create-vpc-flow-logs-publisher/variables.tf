variable "account_name" {
  description = "The name of the account"
  type        = string
}

variable "tags" {
  description = "Tags to apply to created resources"
  type        = map(string)

  default     = {}
}

variable "vpc_iam_role_name" {
  description = "The name of the IAM Role which VPC Flow Logs will use"
  type        = string

  default = "VPCFlowLogsPublisherRole"
}

variable "vpc_iam_role_policy_name" {
  description = "The name of the IAM Role Policy which VPC Flow Logs will use"
  type        = string

  default = "VPCFlowLogsPublisherRole"
}
