module "alarm_baseline" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/alarm-baseline?ref=0.20.0"

  alarm_namespace           = "CloudWatchAlarm"
  cloudtrail_log_group_name = "cloudtrail-multi-region"
  sns_topic_name            = "CloudWatchAlarms"
  tags                      = var.tags
}
