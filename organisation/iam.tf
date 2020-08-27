module "iam_baseline" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/iam-baseline?ref=0.20.0"

  aws_account_id                  = data.aws_caller_identity.current.account_id
  manager_iam_role_name           = "OrgIamManagerRole"
  manager_iam_role_policy_name    = "IamManager"
  master_iam_role_name            = "OrgIamMasterRole"
  master_iam_role_policy_name     = "IamMaster"
  support_iam_role_name           = "OrgSupportRole"
  support_iam_role_policy_name    = "IamSupport"
  support_iam_role_principal_arns = [aws_iam_user.support_user.arn]
  tags                            = {}
}
