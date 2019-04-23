
# create an s3 bucket
resource "aws_s3_bucket" "backup_bucket" {
  bucket = "${var.bucket_name}"
  force_destroy = "true"

  versioning {
    enabled = "${var.versioning}"
  }

  tags = "${var.tags}"
}

resource "aws_s3_bucket_public_access_block" "backup_block" {
  bucket = "${aws_s3_bucket.backup_bucket.id}"

  block_public_acls   = true
  block_public_policy = true
}


output "bucket_name" {
  value = "${aws_s3_bucket.backup_bucket.arn}"
}
