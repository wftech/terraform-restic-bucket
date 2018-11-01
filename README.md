# terraform-restic-bucket

This is terraform module used to prepare S3 bucket for [restic][restic].

Usage:

```!terraform

module "files_backup" {
  source = "github.com/wftech/terraform-restic-bucket"
  bucket_name = "important-files-backup"
  user_name = "files"
  versioning = "true"
  tags = {
    purpose = "files backup"
  }
}
```


## License

2-clause-BSD 

Development sponsored by [Teamguru][teamguru]


[restic]: https://restic.readthedocs.io/
[teamguru]: https://www.teamguru.com/

    
