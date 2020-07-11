output "developer_user_access_key" {
  value       = "${aws_iam_access_key.developer_user.id}"
  description = "The access key for the developer user"
  sensitive   = true
}

output "developer_user_password" {
  value       = "${aws_iam_user_login_profile.developer_user.encrypted_password}"
  description = "The login password for the developer user"
  sensitive   = true
}

output "developer_user_secret_key" {
  value       = "${aws_iam_access_key.developer_user.encrypted_secret}"
  description = "The access secret for the developer user"
  sensitive   = true
}

output "developer_username" {
  value       = "${aws_iam_user.developer_user.name}"
  description = "The login username for the developer user"
  sensitive   = true
}
