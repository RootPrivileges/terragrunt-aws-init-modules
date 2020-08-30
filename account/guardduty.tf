module "guardduty" {
  source = "../guardduty"

  providers = {
    aws.org-ap-northeast-1 = aws.org-ap-northeast-1
    aws.org-ap-northeast-2 = aws.org-ap-northeast-2
    aws.org-ap-south-1     = aws.org-ap-south-1
    aws.org-ap-southeast-1 = aws.org-ap-southeast-1
    aws.org-ap-southeast-2 = aws.org-ap-southeast-2
    aws.org-ca-central-1   = aws.org-ca-central-1
    aws.org-eu-central-1   = aws.org-eu-central-1
    aws.org-eu-north-1     = aws.org-eu-north-1
    aws.org-eu-west-1      = aws.org-eu-west-1
    aws.org-eu-west-2      = aws.org-eu-west-2
    aws.org-eu-west-3      = aws.org-eu-west-3
    aws.org-sa-east-1      = aws.org-sa-east-1
    aws.org-us-east-1      = aws.org-us-east-1
    aws.org-us-east-2      = aws.org-us-east-2
    aws.org-us-west-1      = aws.org-us-west-1
    aws.org-us-west-2      = aws.org-us-west-2

    aws.member-ap-northeast-1 = aws.member-ap-northeast-1
    aws.member-ap-northeast-2 = aws.member-ap-northeast-2
    aws.member-ap-south-1     = aws.member-ap-south-1
    aws.member-ap-southeast-1 = aws.member-ap-southeast-1
    aws.member-ap-southeast-2 = aws.member-ap-southeast-2
    aws.member-ca-central-1   = aws.member-ca-central-1
    aws.member-eu-central-1   = aws.member-eu-central-1
    aws.member-eu-north-1     = aws.member-eu-north-1
    aws.member-eu-west-1      = aws.member-eu-west-1
    aws.member-eu-west-2      = aws.member-eu-west-2
    aws.member-eu-west-3      = aws.member-eu-west-3
    aws.member-sa-east-1      = aws.member-sa-east-1
    aws.member-us-east-1      = aws.member-us-east-1
    aws.member-us-east-2      = aws.member-us-east-2
    aws.member-us-west-1      = aws.member-us-west-1
    aws.member-us-west-2      = aws.member-us-west-2
  }

  org_account_id       = var.org_account_id
  org_detector_ids     = var.org_detector_ids
  member_account_email = aws_organizations_account.account.email
  tags                 = var.tags
}
