output "id" {
  value       = "${module.transit_gateway.this_ec2_transit_gateway_id}"
  description = "The ID of the Transit Gateway"
}

output "route_table_id" {
  value       = "${module.transit_gateway.this_ec2_transit_gateway_route_table_id}"
  description = "The ID of the Transit Gateway route table"
}
