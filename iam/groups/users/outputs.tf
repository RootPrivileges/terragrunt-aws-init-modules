output "arn" {
  value       = "${aws_iam_group.users.arn}"
  description = "The ARN of the users group"
}

output "name" {
  value       = "${aws_iam_group.users.name}"
  description = "The name of the users group"
}

output "unique_id" {
  value       = "${aws_iam_group.users.unique_id}"
  description = "The unique ID of the users group"
}
