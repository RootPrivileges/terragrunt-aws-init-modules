module "assume_role_staging_power_user" {
  source = "../../../utility/iam/create-role-in-different-account-with-assume"

  account_name            = "${var.staging_account_name}"
  account_id              = "${var.staging_account_id}"
  assume_role_policy_json = "${data.aws_iam_policy_document.crossaccount_assume_from_master.json}"
  role                    = "PowerUser"
  role_policy_arn         = "${var.power_user_default_arn}"
}

resource "aws_iam_group" "developers" {
  name = "developers"
}

resource "aws_iam_group_policy_attachment" "assume_role_power_user" {
  group      = aws_iam_group.developers.name
  policy_arn = module.assume_role_staging_power_user.policy_arn
}

