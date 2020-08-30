module "private_subnet" {
  source = "../../utility/networking/create-subnet"

  availability_zone             = var.availability_zone
  subnet_acl_rule_number        = var.acl_rule_number
  subnet_cidr                   = var.subnet_cidr
  subnet_name                   = "${var.availability_zone}-${var.subnet_name}"
  tags                          = var.tags
  target_subnet_acl_id          = var.public_subnet_acl_id
  target_subnet_acl_rule_number = var.public_subnet_acl_rule_number
  target_subnet_cidr_block      = var.public_subnet_cidr_block
  vpc_id                        = var.vpc_id
}

module "nat_gateway" {
  source = "../../utility/networking/create-nat-gateway"

  private_subnet_cidr = var.subnet_cidr
  public_subnet_id    = var.public_subnet_id
  tags                = var.tags
  vpc_id              = var.vpc_id
}

resource "aws_route" "nat_gateway_route" {
  route_table_id         = module.private_subnet.route_table_id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = module.nat_gateway.nat_gateway_id
}
