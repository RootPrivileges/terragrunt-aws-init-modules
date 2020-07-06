resource "aws_iam_user" "user" {
  name          = var.username
  force_destroy = true
}

resource "aws_iam_user_policy_attachment" "attachment" {
  #checkov:skip=CKV_AWS_40:Importing the manually-created administrator user

  user       = aws_iam_user.user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
