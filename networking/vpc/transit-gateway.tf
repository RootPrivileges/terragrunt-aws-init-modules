locals {
  tgw_subnets = [for subnet in module.private_subnets : subnet.subnet_id if subnet.tgw_attachment == true]
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attachment" {
  count = length(local.tgw_subnets) > 0 ? 1 : 0

  subnet_ids         = local.tgw_subnets
  transit_gateway_id = var.transit_gateway_id
  tags               = local.merged_tags
  vpc_id             = aws_vpc.vpc.id
}

resource "aws_ec2_transit_gateway_route" "tgw_routes" {
  count = length(local.tgw_subnets) > 0 ? 1 : 0

  destination_cidr_block         = var.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment.0.id
  transit_gateway_route_table_id = var.transit_gateway_route_table_id
}
