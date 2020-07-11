output "nat_gateway_id" {
  value       = "${aws_nat_gateway.gw.id}"
  description = "The ID of the subnet NAT gateway"
}
