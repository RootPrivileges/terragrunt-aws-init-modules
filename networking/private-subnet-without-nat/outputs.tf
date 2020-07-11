output "acl_id" {
  value       = "${module.private_subnet.acl_id}"
  description = "The ID of the subnet network ACL"
}

output "cidr_block" {
  value       = "${var.subnet_cidr}"
  description = "The CIDR block of the subnet"
}

output "route_table_id" {
  value       = "${module.private_subnet.route_table_id}"
  description = "The ID of the subnet route table"
}

output "subnet_id" {
  value       = "${module.private_subnet.subnet_id}"
  description = "The ID of the subnet"
}
