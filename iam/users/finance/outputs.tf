output "finance_user_password" {
  value       = "${aws_iam_user_login_profile.finance_user.encrypted_password}"
  description = "The login password for the finance user"
  sensitive   = true
}

output "finance_username" {
  value       = "${aws_iam_user.finance_user.name}"
  description = "The login username for the finance user"
  sensitive   = true
}
