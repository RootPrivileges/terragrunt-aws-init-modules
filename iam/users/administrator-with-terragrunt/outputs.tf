output "admin_user_access_key" {
  value       = "${aws_iam_access_key.admin_user.id}"
  description = "The access key for the administrator user"
}

output "admin_user_password" {
  value       = "${aws_iam_user_login_profile.admin_user.encrypted_password}"
  description = "The login password for the administrator user"
}

output "admin_user_secret_key" {
  value       = "${aws_iam_access_key.admin_user.encrypted_secret}"
  description = "The access secret for the administrator user"
}

output "admin_username" {
  value       = "${aws_iam_user.admin_user.name}"
  description = "The login username for the administrator user"
}
