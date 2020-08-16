module "guardduty" {
  source = "../guardduty"

  providers = {
    aws.org-ap-northeast-1 = aws.ap-northeast-1
    aws.org-ap-northeast-2 = aws.ap-northeast-2
    aws.org-ap-south-1     = aws.ap-south-1
    aws.org-ap-southeast-1 = aws.ap-southeast-1
    aws.org-ap-southeast-2 = aws.ap-southeast-2
    aws.org-ca-central-1   = aws.ca-central-1
    aws.org-eu-central-1   = aws.eu-central-1
    aws.org-eu-north-1     = aws.eu-north-1
    aws.org-eu-west-1      = aws.eu-west-1
    aws.org-eu-west-2      = aws.eu-west-2
    aws.org-eu-west-3      = aws.eu-west-3
    aws.org-sa-east-1      = aws.sa-east-1
    aws.org-us-east-1      = aws.us-east-1
    aws.org-us-east-2      = aws.us-east-2
    aws.org-us-west-1      = aws.us-west-1
    aws.org-us-west-2      = aws.us-west-2

    aws.member-ap-northeast-1 = aws.ap-northeast-1
    aws.member-ap-northeast-2 = aws.ap-northeast-2
    aws.member-ap-south-1     = aws.ap-south-1
    aws.member-ap-southeast-1 = aws.ap-southeast-1
    aws.member-ap-southeast-2 = aws.ap-southeast-2
    aws.member-ca-central-1   = aws.ca-central-1
    aws.member-eu-central-1   = aws.eu-central-1
    aws.member-eu-north-1     = aws.eu-north-1
    aws.member-eu-west-1      = aws.eu-west-1
    aws.member-eu-west-2      = aws.eu-west-2
    aws.member-eu-west-3      = aws.eu-west-3
    aws.member-sa-east-1      = aws.sa-east-1
    aws.member-us-east-1      = aws.us-east-1
    aws.member-us-east-2      = aws.us-east-2
    aws.member-us-west-1      = aws.us-west-1
    aws.member-us-west-2      = aws.us-west-2
  }
}
