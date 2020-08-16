output "arn" {
  value       = "${aws_iam_group.finance.arn}"
  description = "The ARN of the finance group"
}

output "name" {
  value       = "${aws_iam_group.finance.name}"
  description = "The name of the finance group"
}

output "unique_id" {
  value       = "${aws_iam_group.finance.unique_id}"
  description = "The unique ID of the finance group"
}
