resource "aws_iam_group" "administrators" {
  name = "administrators"
}

resource "aws_iam_group_policy_attachment" "assume_role_organisation_admin" {
  group      = aws_iam_group.administrators.name
  policy_arn = var.organisation_admin_role_policy_arn
}

resource "aws_iam_group_policy_attachment" "assume_role_management_admin" {
  group      = aws_iam_group.administrators.name
  policy_arn = var.management_admin_role_policy_arn
}

resource "aws_iam_group_policy_attachment" "assume_role_preprod_admin" {
  group      = aws_iam_group.administrators.name
  policy_arn = var.preprod_admin_role_policy_arn
}

resource "aws_iam_group_policy_attachment" "assume_role_production_admin" {
  group      = aws_iam_group.administrators.name
  policy_arn = var.production_admin_role_policy_arn
}

resource "aws_iam_group_policy_attachment" "assume_role_terragrunt_data_reader" {
  group      = aws_iam_group.administrators.name
  policy_arn = var.assume_terragrunt_data_reader_role_policy_arn
}

resource "aws_iam_group_policy_attachment" "assume_role_billing" {
  group      = aws_iam_group.administrators.name
  policy_arn = var.billing_role_policy_arn
}
