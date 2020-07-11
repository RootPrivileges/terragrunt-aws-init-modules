output "internet_gateway_id" {
  value       = "${aws_internet_gateway.gw.id}"
  description = "The ID of the VPC internet gateway"
}

output "vpc_id" {
  value       = "${aws_vpc.vpc.id}"
  description = "The ID of the VPC"
}
