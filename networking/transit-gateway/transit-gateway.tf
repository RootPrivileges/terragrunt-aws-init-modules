module "transit_gateway" {
  source  = "terraform-aws-modules/transit-gateway/aws"
  version = "1.3.0"

  name           = "${var.environment}-tgw"
  ram_principals = [var.organisation_arn]
  tags           = var.tags
}
