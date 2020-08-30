resource "aws_iam_user" "support_user" {
  name = "aws.support@${var.domain}"
  tags = var.tags
}

resource "aws_iam_user_login_profile" "support_user" {
  user    = aws_iam_user.support_user.name
  pgp_key = "keybase:${var.keybase}"
}
