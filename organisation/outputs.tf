output "assume_terragrunt_administrator_role_policy_arn" {
  value = "${module.assume_role_terragrunt_administrator.policy_arn}"
}

output "assume_terragrunt_data_administrator_role_policy_arn" {
  value = "${module.assume_role_terragrunt_data_administrator.policy_arn}"
}

output "assume_terragrunt_data_reader_role_policy_arn" {
  value = "${module.assume_role_terragrunt_data_reader.policy_arn}"
}

output "master_account_id" {
  value = "${data.aws_caller_identity.current.account_id}"
}

output "master_billing_role_policy_arn" {
  value = "${module.assume_role_master_billing.policy_arn}"
}

output "terragrunt_data_administrator_policy_arn" {
  value = "${aws_iam_policy.terragrunt_data_administrator.arn}"
}

output "terragrunt_data_reader_policy_arn" {
  value = "${aws_iam_policy.terragrunt_data_reader.arn}"
}
