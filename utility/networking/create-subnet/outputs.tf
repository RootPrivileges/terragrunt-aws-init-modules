output "acl_id" {
  value       = "${aws_network_acl.subnet_acl.id}"
  description = "The ID of the subnet network ACL"
}

output "route_table_id" {
  value       = "${aws_route_table.route_table.id}"
  description = "The ID of the subnet route table"
}

output "subnet_id" {
  value       = "${aws_subnet.subnet.id}"
  description = "The ID of the subnet"
}

output "subnet_name" {
  value       = "${local.name}"
  description = "The name of the subnet"
}
