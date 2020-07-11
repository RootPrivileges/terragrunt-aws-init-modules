output "vpc_flow_logs_publisher_role_arn" {
  value       = "${aws_iam_role.vpc_flow_logs_publisher.arn}"
  description = "The ARN of the IAM Role that publishes VPC Flow Logs"
}
