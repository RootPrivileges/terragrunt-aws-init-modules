resource "aws_vpc_endpoint" "ec2" {
  count = var.enable_ec2_endpoint ? 1 : 0

  service_name        = "com.amazonaws.${var.aws_region}.ec2"
  private_dns_enabled = true
  security_group_ids  = [aws_security_group.aws_endpoints.id]
  subnet_ids          = var.subnet_ids
  vpc_endpoint_type   = "Interface"
  vpc_id              = var.vpc_id

  tags = merge(
    {
      Name = "${var.environment}-ec2"
    },
    var.tags
  )
}

resource "aws_vpc_endpoint" "ec2messages" {
  count = var.enable_ec2messages_endpoint ? 1 : 0

  service_name        = "com.amazonaws.${var.aws_region}.ec2messages"
  private_dns_enabled = true
  security_group_ids  = [aws_security_group.aws_endpoints.id]
  subnet_ids          = var.subnet_ids
  vpc_endpoint_type   = "Interface"
  vpc_id              = var.vpc_id

  tags = merge(
    {
      Name = "${var.environment}-ec2messages"
    },
    var.tags
  )
}

resource "aws_vpc_endpoint" "s3" {
  count = var.enable_s3_endpoint ? 1 : 0

  service_name      = "com.amazonaws.${var.aws_region}.s3"
  vpc_endpoint_type = "Gateway"
  vpc_id            = var.vpc_id

  tags = merge(
    {
      Name = "${var.environment}-s3"
    },
    var.tags
  )
}

resource "aws_vpc_endpoint" "ssm" {
  count = var.enable_ssm_endpoint ? 1 : 0

  service_name        = "com.amazonaws.${var.aws_region}.ssm"
  private_dns_enabled = true
  security_group_ids  = [aws_security_group.aws_endpoints.id]
  subnet_ids          = var.subnet_ids
  vpc_endpoint_type   = "Interface"
  vpc_id              = var.vpc_id

  tags = merge(
    {
      Name = "${var.environment}-ssm"
    },
    var.tags
  )
}

resource "aws_vpc_endpoint" "ssmmessages" {
  count = var.enable_ssmmessages_endpoint ? 1 : 0

  service_name        = "com.amazonaws.${var.aws_region}.ssmmessages"
  private_dns_enabled = true
  security_group_ids  = [aws_security_group.aws_endpoints.id]
  subnet_ids          = var.subnet_ids
  vpc_endpoint_type   = "Interface"
  vpc_id              = var.vpc_id

  tags = merge(
    {
      Name = "${var.environment}-ssmmessages"
    },
    var.tags
  )
}
