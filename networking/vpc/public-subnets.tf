locals{
    # Create a new list of subnets, one for each definied AZ of each defined public subnet
   public_subnet_list =  flatten([
    for subnet, config in var.public_subnets : [
      for az in config.availability_zones : {
        "${var.aws_region}${az}-${subnet}" = {
          "cidr" = cidrsubnet(config.cidr, length(config.availability_zones)-1, index(config.availability_zones, az))
          "availability_zone" = "${var.aws_region}${az}"
          "name" = subnet
        }
      }
    ]
 ])

 public_subnets = { for item in local.public_subnet_list:
     keys(item)[0] => values(item)[0]
   }
}

module "public_subnet" {
  source = "../public-subnet"

  for_each = local.public_subnets

  availability_zone       = each.value.availability_zone
  subnet_cidr             = each.value.cidr
  subnet_name             = each.value.name
  tags                    = var.tags
  vpc_id                  = aws_vpc.vpc.id
  vpc_internet_gateway_id = aws_internet_gateway.gw.id
}
