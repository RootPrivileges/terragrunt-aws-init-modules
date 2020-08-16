output "arn" {
  value       = "${aws_iam_group.developers.arn}"
  description = "The ARN of the developers group"
}

output "name" {
  value       = "${aws_iam_group.developers.name}"
  description = "The name of the developers group"
}

output "unique_id" {
  value       = "${aws_iam_group.developers.unique_id}"
  description = "The unique ID of the developers group"
}
