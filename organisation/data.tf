data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "config_organisation_assume_role_policy" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "crossaccount_assume_from_organisation" {
  statement {
    sid     = "AssumeFromOrganisation"
    actions = ["sts:AssumeRole"]

    principals {
      type = "AWS"

      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root",
      ]
    }
  }
}

data "aws_iam_policy_document" "terragrunt_data_administrator" {
  statement {
    sid = "AllowListAllS3Buckets"

    actions = [
      "s3:GetBucketLocation",
      "s3:ListAllMyBuckets"
    ]

    resources = [
      "*"
    ]
  }

  statement {
    sid = "AllowS3ActionsOnTerraformBucket"

    actions = [
      "s3:CreateBucket",
      "s3:ListBucket",
      "s3:GetBucketVersioning",
      "s3:PutBucketVersioning",
      "s3:GetBucketTagging",
      "s3:PutBucketTagging",
      "s3:GetEncryptionConfiguration",
      "s3:PutEncryptionConfiguration",
    ]

    resources = [
      "arn:aws:s3:::${var.tfstate_global_bucket}",
    ]
  }

  statement {
    sid = "AllowGetAndPutS3ActionsOnTerraformBucketPath"

    actions = [
      "s3:PutObject",
      "s3:GetObject",
    ]

    resources = [
      "arn:aws:s3:::${var.tfstate_global_bucket}/*",
    ]
  }

  statement {
    sid = "AllowCreateAndUpdateDynamoDBActionsOnTerraformLockTable"

    actions = [
      "dynamodb:PutItem",
      "dynamodb:GetItem",
      "dynamodb:DeleteItem",
      "dynamodb:DescribeTable",
      "dynamodb:CreateTable",
    ]

    resources = [
      "arn:aws:dynamodb:*:*:table/${var.tfstate_global_dynamodb}",
    ]
  }

  statement {
    sid = "AllowTagAndUntagDynamoDBActions"

    actions = [
      "dynamodb:TagResource",
      "dynamodb:UntagResource",
    ]

    resources = [
      "*",
    ]
  }
}

data "aws_iam_policy_document" "terragrunt_data_reader" {
  statement {
    sid = "AllowListAllS3Buckets"

    actions = [
      "s3:GetBucketLocation",
      "s3:ListAllMyBuckets"
    ]

    resources = [
      "*"
    ]
  }

  statement {
    sid = "AllowListS3ActionsOnTerraformBucket"

    actions = [
      "s3:ListBucket",
    ]

    resources = [
      "arn:aws:s3:::${var.tfstate_global_bucket}",
    ]
  }

  statement {
    sid = "AllowGetS3ActionsOnTerraformBucketPath"

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "arn:aws:s3:::${var.tfstate_global_bucket}/*",
    ]
  }
}
