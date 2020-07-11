module "audit_log_bucket_policy" {
  source = "../utility/s3/audit-log-bucket-policy-for-all-accounts"

  audit_logs_bucket_arn = "${var.audit_logs_bucket_arn}"
  audit_logs_bucket_id  = "${var.audit_logs_bucket_id}"
  module_depends_on     = ["${aws_organizations_account.account.id}"]
}
