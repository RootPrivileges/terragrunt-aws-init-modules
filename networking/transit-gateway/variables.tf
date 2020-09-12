variable "account_id" {
  description = "The ID of the account"
  type        = string
}

variable "environment" {
  description = "The name of the environment holding the Transit Gateway"
  type        = string
}

variable "organisation_arn" {
  description = "The ARN for the Organisation"
  type        = string
}
