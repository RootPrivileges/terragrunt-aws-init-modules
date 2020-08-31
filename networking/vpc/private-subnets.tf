locals {
  # Create a new list of subnets, creating a new entry for each defined AZ of each defined public subnet
  # (i.e. ["a", "b", "c"] in eu-west-1 will expand to three subnets, ["eu-west-1a", "eu-west-1b", "eu-west-1c"])
  private_subnet_list = flatten([
    for subnet, config in local.merged_map : [
      for az in config.availability_zones : {
        "${var.aws_region}${az}-${subnet}" = {
          "cidr"                    = cidrsubnet(config.cidr, length(config.availability_zones) - 1, index(config.availability_zones, az))
          "availability_zone"       = "${var.aws_region}${az}"
          "name"                    = subnet
          "private_acl_rule_number" = config.private_acl_rule_number
          "public_acl_rule_number"  = config.public_acl_rule_number
          "public_subnet_name"      = config.public_subnet_name != "" ? "${var.aws_region}${az}-${config.public_subnet_name}" : ""
        }
      }
    ]
  ])
  private_subnets = { for item in local.private_subnet_list :
    keys(item)[0] => values(item)[0]
  }
}

module "private_subnet" {
  source = "../private-subnet"

  for_each = local.private_subnets

  acl_rule_number               = each.value.private_acl_rule_number
  availability_zone             = each.value.availability_zone
  public_subnet_acl_id          = each.value.public_subnet_name != "" ? module.public_subnets["${each.value.public_subnet_name}"].acl_id : ""
  public_subnet_acl_rule_number = each.value.public_acl_rule_number
  public_subnet_name            = each.value.public_subnet_name
  public_subnet_cidr_block      = each.value.public_subnet_name != "" ? module.public_subnets["${each.value.public_subnet_name}"].cidr_block : ""
  public_subnet_id              = each.value.public_subnet_name != "" ? module.public_subnets["${each.value.public_subnet_name}"].subnet_id : ""
  subnet_name                   = each.value.name
  tags                          = var.tags
  vpc_id                        = aws_vpc.vpc.id
}
