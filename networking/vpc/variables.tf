variable "account_id" {
  description = "The ID of the account"
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block to assign to the VPC"
  type        = string
}

variable "environment" {
  description = "The name of the environment being created"
  type        = string
}

variable "private_subnets" {
  description = "The subnets to create as part of the VPC"
  type        = string

  default = ""
}

variable "public_subnets" {
  description = "The subnets to create as part of the VPC"
  type = map(object({
    cidr_size          = string
    availability_zones = list(string)
  }))
}

variable "transit_gateway_id" {
  description = "The ID of the TGW to connect subnets to"
  type        = string

  default = ""
}

variable "transit_gateway_route_table_id" {
  description = "The ID of the TGW route table"
  type        = string

  default = ""
}

variable "vpc_flow_logs_publisher_role_arn" {
  description = "The ARN of the IAM Role which will be used to publish VPC Flow Logs"
  type        = string
}

variable "vpc_log_group_name" {
  description = "The name of CloudWatch Logs group to which VPC Flow Logs are delivered"
  type        = string

  default = "vpc-flow-logs"
}

variable "vpc_log_retention_in_days" {
  description = "The length of time to retain VPC flow logs, in days"
  type        = number

  default = 365
}

locals {
  merged_tags = merge(
    {
      Name = "${var.environment}"
    },
    var.tags
  )

  # Set values for private_subnet keys which may not be set in input definitions (i.e. subnets without NAT gateways)
  default_map_keys = {
    create_nat_gateway      = false
    private_acl_rule_number = 0
    public_acl_rule_number  = 0
    public_subnet_name      = ""
    tgw_attachment          = false
  }

  # Merge missing default keys into private_subnet map
  private_subnets_json = jsondecode(var.private_subnets)
  merged_list = [
    for subnet, config in local.private_subnets_json : {
      "${subnet}" = merge(local.default_map_keys, config)
    }
  ]
  merged_map = { for item in local.merged_list :
    keys(item)[0] => values(item)[0]
  }

  cidr_slash_mask = "${element(split("/", var.cidr_block), 1)}"

  # Map of CIDR blocks to carve into subnets based on size
  subnet_cidr_map = {
    small  = cidrsubnet(var.cidr_block, 20 - local.cidr_slash_mask, 0)  #  14 usable
    medium = cidrsubnet(var.cidr_block, 20 - local.cidr_slash_mask, 4)  #  62 usable
    large  = cidrsubnet(var.cidr_block, 20 - local.cidr_slash_mask, 12) # 126 usable
  }

  # Map the friendly name to our subnet bit mask
  newbit_size = {
    small  = "8"
    medium = "6"
    large  = "5"
  }

  all_subnets = merge(local.private_subnets, local.public_subnets)
}
