resource "aws_vpc" "vpc" {
  cidr_block                       = var.cidr_block
  assign_generated_ipv6_cidr_block = false
  enable_dns_support               = true
  enable_dns_hostnames             = true
  tags                             = local.merged_tags
}

resource "aws_default_security_group" "default_sg" {
  vpc_id = aws_vpc.vpc.id
  tags   = var.tags
}

resource "aws_default_network_acl" "default_nacl" {
  default_network_acl_id = aws_vpc.vpc.default_network_acl_id
  tags                   = local.merged_tags
}

resource "aws_default_route_table" "default_route_route" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id
  tags                   = local.merged_tags
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id
  tags   = local.merged_tags
}

resource "aws_cloudwatch_log_group" "vpc_flow_logs" {
  name              = "${var.environment}-${var.vpc_log_group_name}"
  retention_in_days = var.vpc_log_retention_in_days
  tags              = var.tags
}

resource "aws_flow_log" "all" {
  log_destination = aws_cloudwatch_log_group.vpc_flow_logs.arn
  iam_role_arn    = var.vpc_flow_logs_publisher_role_arn
  vpc_id          = aws_vpc.vpc.id
  traffic_type    = "ALL"
  tags            = var.tags
}
