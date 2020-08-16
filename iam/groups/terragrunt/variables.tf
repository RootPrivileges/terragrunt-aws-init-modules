variable "assume_terragrunt_administrator_role_policy_arn" {
  description = "The ARN of the AssumeTerragruntAdministrator role policy"
  type        = string
}

variable "management_org_account_access_role_policy_arn" {
  description = "The ARN of the AssumeOrganizationAccountAccessRole policy in the Management account"
  type        = string
}

variable "production_org_account_access_role_policy_arn" {
  description = "The ARN of the AssumeOrganizationAccountAccessRole policy in the Production account"
  type        = string
}

variable "preprod_org_account_access_role_policy_arn" {
  description = "The ARN of the AssumeOrganizationAccountAccessRole policy in the Preprod account"
  type        = string
}

variable "terragrunt_data_administrator_policy_arn" {
  description = "The ARN of the TerragruntDataAdministrator policy, allowing write access to Terraform data"
  type        = string
}
