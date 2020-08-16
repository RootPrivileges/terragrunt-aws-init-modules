variable "assume_terragrunt_data_reader_role_policy_arn" {
  description = "The ARN of the AssumeTerragruntDataReaderRole policy"
  type        = string
}

variable "billing_role_policy_arn" {
  description = "The ARN of the Billing role policy "
  type        = string
}

variable "management_admin_role_policy_arn" {
  description = "The ARN of the Administrator role policy in the Management account"
  type        = string
}

variable "organisation_admin_role_policy_arn" {
  description = "The ARN of the Administrator role policy for the Organisation"
  type        = string
}

variable "preprod_admin_role_policy_arn" {
  description = "The ARN of the Administrator role policy in the Preprod account"
  type        = string
}

variable "production_admin_role_policy_arn" {
  description = "The ARN of the Administrator role policy in the Production account"
  type        = string
}
