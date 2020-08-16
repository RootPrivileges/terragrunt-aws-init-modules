resource "aws_iam_group" "terragrunt" {
  name = var.group_name
}

resource "aws_iam_group_policy_attachment" "terragrunt_data_administrator" {
  group      = aws_iam_group.terragrunt.name
  policy_arn = var.terragrunt_data_administrator_policy_arn
}

resource "aws_iam_group_policy_attachment" "assume_terragrunt_administrator" {
  group      = aws_iam_group.terragrunt.name
  policy_arn = var.assume_terragrunt_administrator_role_policy_arn
}

resource "aws_iam_group_policy_attachment" "assume_role_organisation_account_access_management" {
  group      = aws_iam_group.terragrunt.name
  policy_arn = var.management_org_account_access_role_policy_arn
}

resource "aws_iam_group_policy_attachment" "assume_role_organisation_account_access_production" {
  group      = aws_iam_group.terragrunt.name
  policy_arn = var.production_org_account_access_role_policy_arn
}

resource "aws_iam_group_policy_attachment" "assume_role_organisation_account_access_preprod" {
  group      = aws_iam_group.terragrunt.name
  policy_arn = var.preprod_org_account_access_role_policy_arn
}
