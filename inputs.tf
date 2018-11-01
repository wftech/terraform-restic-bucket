variable "user_name" {
  default = "restic"
}

variable "bucket_name" {
  default = "restic-backup"
}
variable "policy_name" {
  default = "ResticBackup"
}

variable "backup_user_prefix" {
  type = "string"
  description = "Name of backup user"
  default = "srv-backup-"
}
variable "restore_user_prefix" {
  type = "string"
  description = "Name of backup user"
  default = "srv-restore"
}
variable "prune_user_prefix" {
  type = "string"
  description = "Name of prune user"
  default = "srv-prune"
}
variable "versioning" {
  type = "string"
  description = "Enable versioning bo S3 bucket (recommended)"
  default = "true"
}

variable "tags" {
  type = "map"
  default = {
    usage = "restic backup"
  }
}