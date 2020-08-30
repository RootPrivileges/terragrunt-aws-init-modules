resource "aws_iam_user" "finance_user" {
  name          = var.email_address
  force_destroy = true
  tags          = var.tags
}

resource "aws_iam_user_login_profile" "finance_user" {
  user    = aws_iam_user.finance_user.name
  pgp_key = "keybase:${var.keybase}"
}

resource "aws_iam_user_group_membership" "finance_groups" {
  user = aws_iam_user.finance_user.name

  groups = [
    "finance",
    "users"
  ]
}
