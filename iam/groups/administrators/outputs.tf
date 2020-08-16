output "arn" {
  value       = "${aws_iam_group.administrators.arn}"
  description = "The ARN of the administrators group"
}

output "name" {
  value       = "${aws_iam_group.administrators.name}"
  description = "The name of the administrators group"
}

output "unique_id" {
  value       = "${aws_iam_group.administrators.unique_id}"
  description = "The unique ID of the administrators group"
}
