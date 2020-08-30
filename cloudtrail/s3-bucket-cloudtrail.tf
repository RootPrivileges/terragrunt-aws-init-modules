resource "aws_s3_bucket" "cloudtrail" {
  #checkov:skip=CKV_AWS_52:Not currently possible to enable MFA delete through Terraform

  policy = data.aws_iam_policy_document.cloudtrail_bucket_policy.json
  bucket = var.cloudtrail_bucket_name
  acl    = "log-delivery-write"

  force_destroy = false

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  object_lock_configuration {
    object_lock_enabled = "Enabled"
  }

  logging {
    target_bucket = var.audit_logs_bucket_id
    target_prefix = "AWSLogs/${data.aws_caller_identity.current.account_id}/S3/${var.cloudtrail_bucket_name}/"
  }

  lifecycle_rule {
    id      = "auto-archive"
    enabled = true

    expiration {
      days = "90"
    }

    transition {
      days          = "30"
      storage_class = "STANDARD_IA"
    }

    noncurrent_version_expiration {
      days = "30"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "cloudtrail" {
  bucket = aws_s3_bucket.cloudtrail.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
