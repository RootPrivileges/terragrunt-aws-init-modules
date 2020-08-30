resource "aws_iam_user" "admin_user" {
  name          = var.email_address
  force_destroy = true
  tags          = var.tags
}

resource "aws_iam_user_login_profile" "admin_user" {
  user    = aws_iam_user.admin_user.name
  pgp_key = "keybase:${var.keybase}"
}

resource "aws_iam_access_key" "admin_user" {
  user    = aws_iam_user.admin_user.name
  pgp_key = "keybase:${var.keybase}"
}

resource "aws_iam_user_group_membership" "administrator_groups" {
  user = aws_iam_user.admin_user.name

  groups = concat([
    var.administrators_group_name,
    var.users_group_name
  ], var.enable_terragrunt ? [var.terragrunt_group_name] : [])
}
