variable "org_account_id" {
  description = "AWS account ID for the organisation account"
  type        = string

  default = ""
}

variable "org_detector_ids" {
  description = "A map of GuardDuty detector IDs in the organisation account"
  type        = map(string)

  default = {
    "ap-northeast-1" = ""
    "ap-northeast-2" = ""
    "ap-south-1"     = ""
    "ap-southeast-1" = ""
    "ap-southeast-2" = ""
    "ca-central-1"   = ""
    "eu-central-1"   = ""
    "eu-north-1"     = ""
    "eu-west-1"      = ""
    "eu-west-2"      = ""
    "eu-west-3"      = ""
    "sa-east-1"      = ""
    "us-east-1"      = ""
    "us-east-2"      = ""
    "us-west-1"      = ""
    "us-west-2"      = ""
  }
}

variable "member_account_email" {
  description = "AWS email address for member account"
  type        = string

  default = ""
}
