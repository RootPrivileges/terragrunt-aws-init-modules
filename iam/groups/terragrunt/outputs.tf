output "arn" {
  value       = "${aws_iam_group.terragrunt.arn}"
  description = "The ARN of the terragrunt group"
}

output "name" {
  value       = "${aws_iam_group.terragrunt.name}"
  description = "The name of the terragrunt group"
}

output "unique_id" {
  value       = "${aws_iam_group.terragrunt.unique_id}"
  description = "The unique ID of the terragrunt group"
}
