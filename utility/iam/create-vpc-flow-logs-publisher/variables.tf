variable "account_name" {
  description = "The name of the account"
}

variable "vpc_iam_role_name" {
  description = "The name of the IAM Role which VPC Flow Logs will use."
  default     = "VPCFlowLogsPublisherRole"
}

variable "vpc_iam_role_policy_name" {
  description = "The name of the IAM Role Policy which VPC Flow Logs will use."
  default     = "VPCFlowLogsPublisherRole"
}
