module "guardduty_baseline_ap-northeast-1" {
  source = "../utility/guardduty/enable-guardduty-in-one-region"

  providers = {
    aws.org    = aws.org-ap-northeast-1
    aws.member = aws.member-ap-northeast-1
  }

  org_account_id       = "${var.org_account_id}"
  org_detector_id      = "${var.org_detector_ids["ap-northeast-1"]}"
  member_account_email = "${var.member_account_email}"
  tags                 = var.tags
}

module "guardduty_baseline_ap-northeast-2" {
  source = "../utility/guardduty/enable-guardduty-in-one-region"

  providers = {
    aws.org    = aws.org-ap-northeast-2
    aws.member = aws.member-ap-northeast-2
  }

  org_account_id       = "${var.org_account_id}"
  org_detector_id      = "${var.org_detector_ids["ap-northeast-2"]}"
  member_account_email = "${var.member_account_email}"
  tags                 = var.tags
}

module "guardduty_baseline_ap-south-1" {
  source = "../utility/guardduty/enable-guardduty-in-one-region"

  providers = {
    aws.org    = aws.org-ap-south-1
    aws.member = aws.member-ap-south-1
  }

  org_account_id       = "${var.org_account_id}"
  org_detector_id      = "${var.org_detector_ids["ap-south-1"]}"
  member_account_email = "${var.member_account_email}"
  tags                 = var.tags
}

module "guardduty_baseline_ap-southeast-1" {
  source = "../utility/guardduty/enable-guardduty-in-one-region"

  providers = {
    aws.org    = aws.org-ap-southeast-1
    aws.member = aws.member-ap-southeast-1
  }

  org_account_id       = "${var.org_account_id}"
  org_detector_id      = "${var.org_detector_ids["ap-southeast-1"]}"
  member_account_email = "${var.member_account_email}"
  tags                 = var.tags
}

module "guardduty_baseline_ap-southeast-2" {
  source = "../utility/guardduty/enable-guardduty-in-one-region"

  providers = {
    aws.org    = aws.org-ap-southeast-2
    aws.member = aws.member-ap-southeast-2
  }

  org_account_id       = "${var.org_account_id}"
  org_detector_id      = "${var.org_detector_ids["ap-southeast-2"]}"
  member_account_email = "${var.member_account_email}"
  tags                 = var.tags
}

module "guardduty_baseline_ca-central-1" {
  source = "../utility/guardduty/enable-guardduty-in-one-region"

  providers = {
    aws.org    = aws.org-ca-central-1
    aws.member = aws.member-ca-central-1
  }

  org_account_id       = "${var.org_account_id}"
  org_detector_id      = "${var.org_detector_ids["ca-central-1"]}"
  member_account_email = "${var.member_account_email}"
  tags                 = var.tags
}

module "guardduty_baseline_eu-central-1" {
  source = "../utility/guardduty/enable-guardduty-in-one-region"

  providers = {
    aws.org    = aws.org-eu-central-1
    aws.member = aws.member-eu-central-1
  }

  org_account_id       = "${var.org_account_id}"
  org_detector_id      = "${var.org_detector_ids["eu-central-1"]}"
  member_account_email = "${var.member_account_email}"
  tags                 = var.tags
}

module "guardduty_baseline_eu-north-1" {
  source = "../utility/guardduty/enable-guardduty-in-one-region"

  providers = {
    aws.org    = aws.org-eu-north-1
    aws.member = aws.member-eu-north-1
  }

  org_account_id       = "${var.org_account_id}"
  org_detector_id      = "${var.org_detector_ids["eu-north-1"]}"
  member_account_email = "${var.member_account_email}"
  tags                 = var.tags
}

module "guardduty_baseline_eu-west-1" {
  source = "../utility/guardduty/enable-guardduty-in-one-region"

  providers = {
    aws.org    = aws.org-eu-west-1
    aws.member = aws.member-eu-west-1
  }

  org_account_id       = "${var.org_account_id}"
  org_detector_id      = "${var.org_detector_ids["eu-west-1"]}"
  member_account_email = "${var.member_account_email}"
  tags                 = var.tags
}

module "guardduty_baseline_eu-west-2" {
  source = "../utility/guardduty/enable-guardduty-in-one-region"

  providers = {
    aws.org    = aws.org-eu-west-2
    aws.member = aws.member-eu-west-2
  }

  org_account_id       = "${var.org_account_id}"
  org_detector_id      = "${var.org_detector_ids["eu-west-2"]}"
  member_account_email = "${var.member_account_email}"
  tags                 = var.tags
}

module "guardduty_baseline_eu-west-3" {
  source = "../utility/guardduty/enable-guardduty-in-one-region"

  providers = {
    aws.org    = aws.org-eu-west-3
    aws.member = aws.member-eu-west-3
  }

  org_account_id       = "${var.org_account_id}"
  org_detector_id      = "${var.org_detector_ids["eu-west-3"]}"
  member_account_email = "${var.member_account_email}"
  tags                 = var.tags
}

module "guardduty_baseline_sa-east-1" {
  source = "../utility/guardduty/enable-guardduty-in-one-region"

  providers = {
    aws.org    = aws.org-sa-east-1
    aws.member = aws.member-sa-east-1
  }

  org_account_id       = "${var.org_account_id}"
  org_detector_id      = "${var.org_detector_ids["sa-east-1"]}"
  member_account_email = "${var.member_account_email}"
  tags                 = var.tags
}

module "guardduty_baseline_us-east-1" {
  source = "../utility/guardduty/enable-guardduty-in-one-region"

  providers = {
    aws.org    = aws.org-us-east-1
    aws.member = aws.member-us-east-1
  }

  org_account_id       = "${var.org_account_id}"
  org_detector_id      = "${var.org_detector_ids["us-east-1"]}"
  member_account_email = "${var.member_account_email}"
  tags                 = var.tags
}

module "guardduty_baseline_us-east-2" {
  source = "../utility/guardduty/enable-guardduty-in-one-region"

  providers = {
    aws.org    = aws.org-us-east-2
    aws.member = aws.member-us-east-2
  }

  org_account_id       = "${var.org_account_id}"
  org_detector_id      = "${var.org_detector_ids["us-east-2"]}"
  member_account_email = "${var.member_account_email}"
  tags                 = var.tags
}

module "guardduty_baseline_us-west-1" {
  source = "../utility/guardduty/enable-guardduty-in-one-region"

  providers = {
    aws.org    = aws.org-us-west-1
    aws.member = aws.member-us-west-1
  }

  org_account_id       = "${var.org_account_id}"
  org_detector_id      = "${var.org_detector_ids["us-west-1"]}"
  member_account_email = "${var.member_account_email}"
  tags                 = var.tags
}

module "guardduty_baseline_us-west-2" {
  source = "../utility/guardduty/enable-guardduty-in-one-region"

  providers = {
    aws.org    = aws.org-us-west-2
    aws.member = aws.member-us-west-2
  }

  org_account_id       = "${var.org_account_id}"
  org_detector_id      = "${var.org_detector_ids["us-west-2"]}"
  member_account_email = "${var.member_account_email}"
  tags                 = var.tags
}
