module "iam_vpc_flow_logs_publisher" {
  source = "../utility/iam/create-vpc-flow-logs-publisher"

  account_name = "org"
  tags         = var.tags
}

module "harden_default_vpc" {
  source = "../utility/networking/harden-default-vpc-in-all-regions"

  providers = {
    aws.ap-northeast-1 = aws.ap-northeast-1
    aws.ap-northeast-2 = aws.ap-northeast-2
    aws.ap-south-1     = aws.ap-south-1
    aws.ap-southeast-1 = aws.ap-southeast-1
    aws.ap-southeast-2 = aws.ap-southeast-2
    aws.ca-central-1   = aws.ca-central-1
    aws.eu-central-1   = aws.eu-central-1
    aws.eu-north-1     = aws.eu-north-1
    aws.eu-west-1      = aws.eu-west-1
    aws.eu-west-2      = aws.eu-west-2
    aws.eu-west-3      = aws.eu-west-3
    aws.sa-east-1      = aws.sa-east-1
    aws.us-east-1      = aws.us-east-1
    aws.us-east-2      = aws.us-east-2
    aws.us-west-1      = aws.us-west-1
    aws.us-west-2      = aws.us-west-2
  }

  account_name                     = "organisation-account"
  tags                             = var.tags
  vpc_flow_logs_publisher_role_arn = module.iam_vpc_flow_logs_publisher.vpc_flow_logs_publisher_role_arn
}
