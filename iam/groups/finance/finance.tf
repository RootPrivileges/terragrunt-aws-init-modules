resource "aws_iam_group" "finance" {
  name = var.group_name
}

resource "aws_iam_group_policy_attachment" "billing" {
  group      = aws_iam_group.finance.name
  policy_arn = "arn:aws:iam::aws:policy/job-function/Billing"
}
