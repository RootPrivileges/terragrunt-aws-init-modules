module "assume_role_billing" {
  source = "../utility/iam/create-role-with-assume"

  account_name            = "org"
  account_id              = "${data.aws_caller_identity.current.account_id}"
  assume_role_policy_json = "${data.aws_iam_policy_document.crossaccount_assume_from_organisation.json}"
  role                    = "Billing"
  role_policy_arn         = "${var.billing_default_arn}"
  tags                    = var.tags
}
