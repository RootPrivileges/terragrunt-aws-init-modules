variable "account_email_slug" {
  description = "The slug (before the @ symbol) to use for the account email address"
  type        = string
}

variable "account_name" {
  description = "The name of the account"
  type        = string
}

variable "administrator_default_arn" {
  description = "The default ARN for Administrators"
  type        = string

  default     = "arn:aws:iam::aws:policy/AdministratorAccess"
}

variable "domain" {
  description = "The domain to use for account email addresses"
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
