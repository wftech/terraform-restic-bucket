
resource "aws_iam_policy" "backup_policy" {
  name        = "backup-${var.policy_name}"
  path        = "/"
  description = "Backup policy for ${var.bucket_name}"

  policy = <<EOF
{
 "Version":"2012-10-17",
 "Statement": [
   {
     "Sid": "AllowUserToSeeBucketListInTheConsole",
     "Action": [ "s3:GetBucketLocation", "s3:ListBucket" ],
     "Effect": "Allow",
     "Resource": [ "${aws_s3_bucket.backup_bucket.arn}" ]
   },
   {
      "Sid": "ListMyBuckets",
      "Effect": "Allow",
      "Action": "s3:ListAllMyBuckets",
      "Resource": "*"
   },
   {
     "Sid": "S3AllowUpload",
     "Effect": "Allow",
     "Action": ["s3:PutObject", "s3:GetObject"],
     "Resource": [
        "${aws_s3_bucket.backup_bucket.arn}",
        "${aws_s3_bucket.backup_bucket.arn}/*"
      ]
   },
   {
     "Sid": "S3AllowLocking",
     "Effect": "Allow",
     "Action": ["s3:PutObject", "s3:GetObject", "s3:DeleteObject"],
     "Resource": [
        "${aws_s3_bucket.backup_bucket.arn}/locks/*"
      ]
   }
 ]
}
EOF
}

resource "aws_iam_user_policy_attachment" "backup_attachment" {
    user       = "${aws_iam_user.backup_user.name}"
    policy_arn = "${aws_iam_policy.backup_policy.arn}"
}

resource "aws_iam_policy" "prune_policy" {
  name        = "prune-${var.policy_name}"
  path        = "/"
  description = "Prune policy for ${var.bucket_name}"

  policy = <<EOF
{
 "Version":"2012-10-17",
 "Statement": [
   {
     "Sid": "AllowUserToSeeBucketListInTheConsole",
     "Action": [ "s3:GetBucketLocation", "s3:ListBucket" ],
     "Effect": "Allow",
     "Resource": [ "${aws_s3_bucket.backup_bucket.arn}" ]
   },
   {
      "Sid": "ListMyBuckets",
      "Effect": "Allow",
      "Action": "s3:ListAllMyBuckets",
      "Resource": "*"
   },

   {
     "Sid": "S3AllowUpload",
     "Effect": "Allow",
     "Action": ["s3:PutObject", "s3:DeleteObject", "s3:GetObject"],
     "Resource": [
        "${aws_s3_bucket.backup_bucket.arn}",
        "${aws_s3_bucket.backup_bucket.arn}/*"
      ]
   }
 ]
}
EOF
}

resource "aws_iam_user_policy_attachment" "prune_attachment" {
    user       = "${aws_iam_user.prune_user.name}"
    policy_arn = "${aws_iam_policy.prune_policy.arn}"
}



resource "aws_iam_policy" "restore_policy" {
  name        = "restore-${var.policy_name}"
  path        = "/"
  description = "Restore Policy for ${var.bucket_name}"

  policy = <<EOF
{
 "Version":"2012-10-17",
 "Statement": [
   {
     "Sid": "AllowUserToSeeBucketListInTheConsole",
     "Action": [ "s3:GetBucketLocation", "s3:ListBucket" ],
     "Effect": "Allow",
     "Resource": [ "${aws_s3_bucket.backup_bucket.arn}" ]
   },
   {
      "Sid": "ListMyBuckets",
      "Effect": "Allow",
      "Action": "s3:ListAllMyBuckets",
      "Resource": "*"
   },
   {
     "Sid": "S3AllowDownload",
     "Effect": "Allow",
     "Action": ["s3:GetObject"],
     "Resource": [
        "${aws_s3_bucket.backup_bucket.arn}",
        "${aws_s3_bucket.backup_bucket.arn}/*"
      ]
   },

   {
     "Sid": "S3AllowLocking",
     "Effect": "Allow",
     "Action": ["s3:PutObject", "s3:GetObject", "s3:DeleteObject"],
     "Resource": [
        "${aws_s3_bucket.backup_bucket.arn}/locks/*"
      ]
   }
 ]
}
EOF
}

resource "aws_iam_user_policy_attachment" "restore_attachment" {
    user       = "${aws_iam_user.restore_user.name}"
    policy_arn = "${aws_iam_policy.restore_policy.arn}"
}
