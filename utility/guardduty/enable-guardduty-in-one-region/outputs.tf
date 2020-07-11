output "detector_id" {
  value       = "${aws_guardduty_detector.default.id}"
  description = "The ID of the GuardDuty detector"
}
