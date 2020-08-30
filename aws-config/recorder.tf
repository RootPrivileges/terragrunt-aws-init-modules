resource "aws_iam_role" "recorder" {
  name               = "Assume${title(var.account_name)}ConfigRecorderRole"
  assume_role_policy = data.aws_iam_policy_document.recorder_assume_role_policy.json
  tags               = var.tags
}

resource "aws_iam_role_policy" "recorder_publish_policy" {
  name   = "${title(var.account_name)}ConfigPublisherRole"
  role   = aws_iam_role.recorder.id
  policy = data.aws_iam_policy_document.recorder_publish_policy.json
}

resource "aws_iam_role_policy_attachment" "recorder_read_policy" {
  role       = aws_iam_role.recorder.id
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRole"
}
