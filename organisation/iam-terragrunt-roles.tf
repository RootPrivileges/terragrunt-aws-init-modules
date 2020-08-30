module "assume_role_terragrunt_administrator" {
  source = "../utility/iam/create-role-with-assume"

  account_name            = "org"
  account_id              = "${data.aws_caller_identity.current.account_id}"
  assume_role_policy_json = "${data.aws_iam_policy_document.crossaccount_assume_from_organisation.json}"
  role                    = "TerragruntAdministrator"
  role_policy_arn         = "${var.administrator_default_arn}"
}

resource "aws_iam_policy" "terragrunt_data_administrator" {
  name        = "TerragruntDataAdministratorAccess"
  policy      = data.aws_iam_policy_document.terragrunt_data_administrator.json
  description = "Grants permissions to manage Terraform remote state"
}

module "assume_role_terragrunt_data_administrator" {
  source = "../utility/iam/create-role-with-assume"

  account_name            = "org"
  account_id              = "${data.aws_caller_identity.current.account_id}"
  assume_role_policy_json = "${data.aws_iam_policy_document.crossaccount_assume_from_organisation.json}"
  role                    = "TerragruntDataAdministrator"
  role_policy_arn         = "${aws_iam_policy.terragrunt_data_administrator.arn}"
}

resource "aws_iam_policy" "terragrunt_data_reader" {
  name        = "TerragruntDataReaderAccess"
  policy      = data.aws_iam_policy_document.terragrunt_data_reader.json
  description = "Grants permissions to read Terraform remote state"
}

module "assume_role_terragrunt_data_reader" {
  source = "../utility/iam/create-role-with-assume"

  account_name            = "org"
  account_id              = "${data.aws_caller_identity.current.account_id}"
  assume_role_policy_json = "${data.aws_iam_policy_document.crossaccount_assume_from_organisation.json}"
  role                    = "TerragruntDataReader"
  role_policy_arn         = "${aws_iam_policy.terragrunt_data_reader.arn}"
}
