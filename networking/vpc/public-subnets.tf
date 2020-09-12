locals {
  # Create a new list of subnets, creating a new entry for each defined AZ of each defined public subnet
  # (i.e. ["a", "b", "c"] in eu-west-1 will expand to three subnets, ["eu-west-1a", "eu-west-1b", "eu-west-1c"])
  public_subnet_list = flatten([
    for subnet, config in var.public_subnets : [
      for az in config.availability_zones : {
        "${var.aws_region}${az}-${subnet}" = {
          "cidr_size"         = config.cidr_size
          "availability_zone" = "${var.aws_region}${az}"
          "name"              = subnet
        }
      }
    ]
  ])

  public_subnets = { for item in local.public_subnet_list :
    keys(item)[0] => values(item)[0]
  }
}

module "public_subnets" {
  source = "../public-subnet"

  for_each = local.public_subnets

  availability_zone       = each.value.availability_zone
  subnet_cidr             = lookup(local.subnet_allocations, each.key)
  subnet_name             = "${var.environment}-${each.value.name}"
  tags                    = var.tags
  vpc_id                  = aws_vpc.vpc.id
  vpc_internet_gateway_id = aws_internet_gateway.gw.id
}
