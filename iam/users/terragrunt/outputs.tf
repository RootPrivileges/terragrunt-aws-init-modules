output "terragrunt_user_access_key" {
  value       = "${aws_iam_access_key.terragrunt_user.id}"
  description = "The access key for the terragrunt user"
  sensitive   = true
}

output "terragrunt_user_secret_key" {
  value       = "${aws_iam_access_key.terragrunt_user.encrypted_secret}"
  description = "The access secret for the terragrunt user"
  sensitive   = true
}
