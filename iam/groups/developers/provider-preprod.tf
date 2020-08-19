provider "aws" {
  region = var.aws_region
  alias  = "preprod"

  assume_role {
    role_arn = "arn:aws:iam::${var.preprod_account_id}:role/OrganizationAccountAccessRole"
  }
}
