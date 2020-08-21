provider "aws" {
  alias = "member"

  assume_role {
    role_arn = "arn:aws:iam::${var.account_id}:role/OrganizationAccountAccessRole"
  }
}

module "private_subnet" {
  source = "../../utility/networking/create-subnet"

  providers = {
    aws = aws.member
  }

  availability_zone             = var.availability_zone
  subnet_acl_rule_number        = var.acl_rule_number
  subnet_cidr                   = var.subnet_cidr
  subnet_name                   = "${var.availability_zone}-${var.subnet_name}"
  target_subnet_acl_id          = var.public_subnet_acl_id
  target_subnet_acl_rule_number = var.public_subnet_acl_rule_number
  target_subnet_cidr_block      = var.public_subnet_cidr_block
  vpc_id                        = var.vpc_id
}

module "nat_gateway" {
  source = "../../utility/networking/create-nat-gateway"

  providers = {
    aws = aws.member
  }

  private_subnet_cidr = var.subnet_cidr
  public_subnet_id    = var.public_subnet_id
  vpc_id              = var.vpc_id
}

resource "aws_route" "nat_gateway_route" {
  provider = aws.member

  route_table_id         = module.private_subnet.route_table_id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = module.nat_gateway.nat_gateway_id
}
