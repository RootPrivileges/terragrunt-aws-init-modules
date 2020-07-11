output "cloudtrail_bucket_arn" {
  value       = "${aws_s3_bucket.cloudtrail.arn}"
  description = "The ARN of CloudTrail S3 bucket"
}

output "cloudtrail_bucket_id" {
  value       = "${aws_s3_bucket.cloudtrail.id}"
  description = "The ID of CloudTrail S3 bucket"
}
