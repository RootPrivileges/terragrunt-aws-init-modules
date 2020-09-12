module "small_subnets" {
  source = "hashicorp/subnets/cidr"

  base_cidr_block = local.subnet_cidr_map["small"]
  networks = [
    for name, subnet in local.all_subnets : {
      "name"     = name
      "new_bits" = local.newbit_size["small"]
    } if subnet.cidr_size == "small"
  ]
}

module "medium_subnets" {
  source = "hashicorp/subnets/cidr"

  base_cidr_block = local.subnet_cidr_map["medium"]
  networks = [
    for name, subnet in local.all_subnets : {
      "name"     = name
      "new_bits" = local.newbit_size["medium"]
    } if subnet.cidr_size == "medium"
  ]
}

module "large_subnets" {
  source = "hashicorp/subnets/cidr"

  base_cidr_block = local.subnet_cidr_map["large"]
  networks = [
    for name, subnet in local.all_subnets : {
      "name"     = name
      "new_bits" = local.newbit_size["large"]
    } if subnet.cidr_size == "large"
  ]
}

locals {
  subnet_allocations = merge(module.small_subnets.network_cidr_blocks,
    module.medium_subnets.network_cidr_blocks,
  module.large_subnets.network_cidr_blocks)
}
