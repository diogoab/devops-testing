module "s3_bucket" {
  source = "modules/s3"
  bucketname = "crazy-reports-hourly"
  acl    = "private"
  version = true
  env = "testing"
  lifecycle_rule = "crazy-reports-hourly"
  transition = 5
  expiration = 15
}

module "s3_bucket" {
  source = "modules/s3"
  bucketname = "crazy-reports-daily"
  acl    = "private"
  version = true
  env = "testing"
  lifecycle_rule = "crazy-reports-hourly"
  transition = 7
  expiration = 60
}

module "s3_bucket" {
  source = "modules/s3"
  bucketname = "crazy-reports-weekly"
  acl    = "private"
  version = true
  env = "testing"
  lifecycle_rule = "crazy-reports-weekly"
  transition = 30
  expiration = 90
}