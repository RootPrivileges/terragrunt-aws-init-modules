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

variable "preprod_account_id" {
  description = "AWS account ID for the Preprod account"
  type        = string
}

variable "preprod_account_name" {
  description = "The name of the Preprod account"
  type        = string
}
