resource "aws_iam_group_policy_attachment" "assume_role_organisation_account_access_management" {
  group      = aws_iam_group.terragrunt.name
  policy_arn = var.management_org_account_access_role_policy_arn
}
