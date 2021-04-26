module "s3_bucket_hourly" {
  source = "./modules/s3"
  bucketname = "crazy-reports-hourly"
  acl    = "private"
  environment = "testing"
  lifecycle_rule = "crazy-reports-hourly"
  transition = "5"
  expiration = "15"
}

module "s3_bucket_daily" {
  source = "./modules/s3"
  bucketname = "crazy-reports-daily"
  acl    = "private"
  environment = "testing"
  lifecycle_rule = "crazy-reports-hourly"
  transition = "7"
  expiration = "60"
}

module "s3_bucket_weekly" {
  source = "./modules/s3"
  bucketname = "crazy-reports-weekly"
  acl    = "private"
  environment = "testing"
  lifecycle_rule = "crazy-reports-weekly"
  transition = "30"
  expiration = "90"
}
