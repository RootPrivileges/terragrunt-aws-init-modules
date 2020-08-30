data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "assume_role_organisation_account_access" {
  statement {
    sid     = "Assume${title(var.account_name)}OrganizationAccountAccessRole"
    actions = ["sts:AssumeRole"]

    resources = [
      "arn:aws:iam::${aws_organizations_account.account.id}:role/OrganizationAccountAccessRole",
    ]
  }
}

data "aws_iam_policy_document" "crossaccount_assume_from_organisation" {
  statement {
    sid     = "AssumeFromOrganisation"
    actions = ["sts:AssumeRole"]

    principals {
      type = "AWS"

      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root",
      ]
    }
  }
}
