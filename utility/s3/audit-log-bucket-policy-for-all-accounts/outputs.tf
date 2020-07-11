output "policy" {
  value = "${data.aws_iam_policy_document.audit_log_policy}"
  description = "The IAM policy for the audit logs S3 bucket, allowing access to all accounts"
}
