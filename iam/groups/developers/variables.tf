variable "power_user_default_arn" {
  description = "The default ARN for developers"
  type        = string

  default = "arn:aws:iam::aws:policy/PowerUserAccess"
}

variable "role_name" {
  description = "The name of the role for developers"
  type        = string

  default = "Developer"
}

variable "staging_account_id" {
  description = "AWS account ID for the Staging account"
  type        = string
}

variable "staging_account_name" {
  description = "The name of the Staging account"
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
