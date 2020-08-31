locals {
  # Set values for keys which may not be set in input definitions (i.e. subnets without NAT gateways)
  default_map_keys = {
    private_acl_rule_number = 0
    public_acl_rule_number  = 0
    public_subnet_name      = ""
  }

  # Merge missing default keys into subnet map
  private_subnets_json = jsondecode(var.private_subnets)
  merged_list = [
    for subnet, config in local.private_subnets_json : {
      "${subnet}" = merge(local.default_map_keys, config)
    }
  ]
  merged_map = { for item in local.merged_list :
    keys(item)[0] => values(item)[0]
  }

  # Create a new list of subnets, one for each defined AZ of each defined private subnet
  private_subnet_list = flatten([
    for subnet, config in local.merged_map : [
      for az in config.availability_zones : {
        "${var.aws_region}${az}-${subnet}" = {
          "cidr"                    = cidrsubnet(config.cidr, length(config.availability_zones) - 1, index(config.availability_zones, az))
          "availability_zone"       = "${var.aws_region}${az}"
          "name"                    = subnet
          "private_acl_rule_number" = config.private_acl_rule_number
          "public_acl_rule_number"  = config.public_acl_rule_number
          "public_subnet_name"      = config.public_subnet_name
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
  public_subnet_acl_id          = each.value.public_subnet_name != "" ? module.public_subnet["${each.value.availability_zone}-${each.value.public_subnet_name}"].acl_id : ""
  public_subnet_acl_rule_number = each.value.public_acl_rule_number
  public_subnet_name            = each.value.public_subnet_name
  public_subnet_cidr_block      = each.value.public_subnet_name != "" ? module.public_subnet["${each.value.availability_zone}-${each.value.public_subnet_name}"].cidr_block : ""
  public_subnet_id              = each.value.public_subnet_name != "" ? module.public_subnet["${each.value.availability_zone}-${each.value.public_subnet_name}"].subnet_id : ""
  subnet_cidr                   = each.value.cidr
  subnet_name                   = each.value.name
  tags                          = var.tags
  vpc_id                        = aws_vpc.vpc.id
}
