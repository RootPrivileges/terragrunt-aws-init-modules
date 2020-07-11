output "account_id" {
  value       = "${aws_organizations_account.account.id}"
  description = "The ID of the AWS account"
}

output "account_name" {
  value       = "${aws_organizations_account.account.name}"
  description = "The name of the AWS account"
}

output "admin_role_policy_arn" {
  value       = "${module.assume_role_account_administrator.policy_arn}"
  description = "The ARN of the Administrator role policy"
}

output "org_account_access_role_policy_arn" {
  value       = "${aws_iam_policy.assume_role_organisation_account_access.arn}"
  description = "The ARN of the OrganisationAccountAccessRole policy"
}

output "vpc_flow_logs_publisher_role_arn" {
  value       = "${module.iam_vpc_flow_logs_publisher.vpc_flow_logs_publisher_role_arn}"
  description = "The ARN of the IAM Role which publishes VPC Flow Logs"
}
