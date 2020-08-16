resource "aws_guardduty_detector" "default" {
  provider = aws.member

  finding_publishing_frequency = var.finding_publishing_frequency
}

resource "aws_guardduty_member" "member" {
  depends_on = [aws_guardduty_detector.default]

  count = var.org_account_id != "" ? 1 : 0

  provider = aws.org

  account_id                 = aws_guardduty_detector.default.account_id
  detector_id                = var.org_detector_id
  disable_email_notification = true
  email                      = var.member_account_email
  invite                     = true
}

resource "aws_guardduty_invite_accepter" "organisation" {
  depends_on = [aws_guardduty_member.member]

  count = var.org_account_id != "" ? 1 : 0

  provider = aws.member

  detector_id       = aws_guardduty_detector.default.id
  master_account_id = var.org_account_id
}
