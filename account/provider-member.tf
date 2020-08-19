provider "aws" {
  region = var.aws_region
  alias  = "member"

  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.account.id}:role/OrganizationAccountAccessRole"
  }
}
