output "account_id" {
  value       = "${data.aws_caller_identity.current.account_id}"
  description = "The ID of the Organisation"
}

output "assume_terragrunt_administrator_role_policy_arn" {
  value       = "${module.assume_role_terragrunt_administrator.policy_arn}"
  description = "The ARN of the AssumeTerragruntAdministratorRole policy"
}

output "assume_terragrunt_data_administrator_role_policy_arn" {
  value       = "${module.assume_role_terragrunt_data_administrator.policy_arn}"
  description = "The ARN of the AssumeTerragruntDataAdministratorRole policy"
}

output "assume_terragrunt_data_reader_role_policy_arn" {
  value       = "${module.assume_role_terragrunt_data_reader.policy_arn}"
  description = "The ARN of the AssumeTerragruntDataReaderRole policy"
}

output "audit_logs_bucket_arn" {
  value       = "${aws_s3_bucket.audit_logs.arn}"
  description = "The ARN of the S3 bucket holding audit data"
}

output "audit_logs_bucket_id" {
  value       = "${aws_s3_bucket.audit_logs.id}"
  description = "The ID of the S3 bucket holding audit data"
}

output "billing_role_policy_arn" {
  value       = "${module.assume_role_billing.policy_arn}"
  description = "The ARN of the Billing rol policy"
}

output "cloudtrail_bucket_arn" {
  value       = "${module.cloudtrail.cloudtrail_bucket_arn}"
  description = "The ARN of the S3 bucket holding CloudTrail data"
}

output "cloudtrail_bucket_id" {
  value       = "${module.cloudtrail.cloudtrail_bucket_id}"
  description = "The ID of the S3 bucket holding CloudTrail data"
}

output "detector_ids" {
  value       = {
    "ap-northeast-1" = "${module.guardduty.detector_ap-northeast-1}"
    "ap-northeast-2" = "${module.guardduty.detector_ap-northeast-2}"
    "ap-south-1"     = "${module.guardduty.detector_ap-south-1}"
    "ap-southeast-1" = "${module.guardduty.detector_ap-southeast-1}"
    "ap-southeast-2" = "${module.guardduty.detector_ap-southeast-2}"
    "ca-central-1"   = "${module.guardduty.detector_ca-central-1}"
    "eu-central-1"   = "${module.guardduty.detector_eu-central-1}"
    "eu-north-1"     = "${module.guardduty.detector_eu-north-1}"
    "eu-west-1"      = "${module.guardduty.detector_eu-west-1}"
    "eu-west-2"      = "${module.guardduty.detector_eu-west-2}"
    "eu-west-3"      = "${module.guardduty.detector_eu-west-3}"
    "sa-east-1"      = "${module.guardduty.detector_sa-east-1}"
    "us-east-1"      = "${module.guardduty.detector_us-east-1}"
    "us-east-2"      = "${module.guardduty.detector_us-east-2}"
    "us-west-1"      = "${module.guardduty.detector_us-west-1}"
    "us-west-2"      = "${module.guardduty.detector_us-west-2}"
  }

  description = "The IDs of GuardDuty detectors in each region"
}

output "organisation_admin_role_policy_arn" {
  value       = "${var.organisation_admin_role_policy_arn}"
  description = "The ARN of the Administrator role policy for the Organisation"
}

output "support_user_name" {
  value       = "${aws_iam_user.support_user.name}"
  description = "The login username of the user able to assume the AWS support role"
  sensitive   = true
}

output "support_user_password" {
  value       = "${aws_iam_user_login_profile.support_user.encrypted_password}"
  description = "The login password of the user able to assume the AWS support role"
  sensitive   = true
}

output "terragrunt_data_administrator_policy_arn" {
  value       = "${aws_iam_policy.terragrunt_data_administrator.arn}"
  description = "The ARN of the TerragruntDataAdministrator policy"
}

output "terragrunt_data_reader_policy_arn" {
  value       = "${aws_iam_policy.terragrunt_data_reader.arn}"
  description = "The ARN of the TerragruntDataReader policy"
}

output "vpc_flow_logs_publisher_role_arn" {
  value       = "${module.iam_vpc_flow_logs_publisher.vpc_flow_logs_publisher_role_arn}"
  description = "The ARN of the IAM Role that publishes VPC Flow Logs"
}
