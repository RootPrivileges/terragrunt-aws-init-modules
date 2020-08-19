variable "admin_email" {
  description = "The email address assigned to the terraform-created administrator user"
  type        = string
}

variable "administrator_default_arn" {
  description = "The default ARN for Administrators"
  type        = string

  default = "arn:aws:iam::aws:policy/AdministratorAccess"
}

variable "audit_logs_bucket_name" {
  description = "The name of the S3 bucket holding audit data"
  type        = string
}

variable "billing_alarm_currency" {
  description = "The currency of the billing alarm"
  type        = string

  default = "USD"
}

variable "billing_alarm_threshold" {
  description = "The threshold of the billing alarm"
  type        = string
}

variable "billing_default_arn" {
  description = "The default ARN for Billing"
  type        = string

  default = "arn:aws:iam::aws:policy/job-function/Billing"
}

variable "cloudtrail_bucket_name" {
  description = "The name of the S3 bucket holding cloudtrail data"
  type        = string
}

variable "domain" {
  description = "The domain to use for account email addresses"
  type        = string
}

variable "keybase" {
  description = "The keybase profile to encrypt secrets"
  type        = string
}

variable "organisation_admin_role_policy_arn" {
  description = "The ARN of the Administrator role policy for the Organisation"
  type        = string
}

variable "tfstate_global_bucket" {
  description = "The S3 bucket that holds Terraform state"
  type        = string
}

variable "tfstate_global_dynamodb" {
  description = "The DynamoDB table that holds Terraform locks"
  type        = string
}
