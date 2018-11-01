
resource "aws_iam_user" "backup_user" {
  name = "${var.backup_user_prefix}-${var.user_name}"
}

resource "aws_iam_user" "prune_user" {
  name = "${var.prune_user_prefix}-${var.user_name}"
}


resource "aws_iam_user" "restore_user" {
  name = "${var.restore_user_prefix}-${var.user_name}"
}

# generate keys for restore account prune user
resource "aws_iam_access_key" "restore_user_key" {
  user = "${aws_iam_user.restore_user.name}"
}

output "restore_access_key_id" {
  value = "${aws_iam_access_key.restore_user_key.id}"
}

output "restore_access_key_secret" {
  value = "${aws_iam_access_key.restore_user_key.secret}"
}


# generate backup user keys
resource "aws_iam_access_key" "user_key" {
  user = "${aws_iam_user.backup_user.name}"
}

output "backup_access_key_id" {
  value = "${aws_iam_access_key.user_key.id}"
}

output "backup_access_key_secret" {
  value = "${aws_iam_access_key.user_key.secret}"
}

# generate keys for service account prune user
resource "aws_iam_access_key" "prune_user_key" {
  user = "${aws_iam_user.prune_user.name}"
}

output "prune_access_key_id" {
  value = "${aws_iam_access_key.prune_user_key.id}"
}

output "prune_access_key_secret" {
  value = "${aws_iam_access_key.prune_user_key.secret}"
}

