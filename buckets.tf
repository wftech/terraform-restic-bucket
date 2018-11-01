
# create an s3 bucket
resource "aws_s3_bucket" "backup_bucket" {
  bucket = "${var.bucket_name}"
  force_destroy = "true"

  versioning {
    enabled = "${var.versioning}"
  }

  tags = "${var.tags}"
}

output "bucket_name" {
  value = "${aws_s3_bucket.backup_bucket.arn}"
}
