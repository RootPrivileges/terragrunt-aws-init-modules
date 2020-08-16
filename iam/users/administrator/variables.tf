variable "administrators_group_name" {
  description = "The name of the administrators group"
  type        = string
}

variable "email_address" {
  description = "The email address of the admin user, used as the username"
  type        = string
}

variable "enable_terragrunt" {
  description = "Configure the user with the permissions to use terragrunt"
  type        = bool

  default = false
}

variable "keybase" {
  description = "The keybase profile to encrypt secrets"
  type        = string
}

variable "terragrunt_group_name" {
  description = "The name of the terragrunt group"
  type        = string

  default = ""
}

variable "users_group_name" {
  description = "The name of the users group"
  type        = string
}
