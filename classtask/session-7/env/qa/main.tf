module "s3_bucket" {
  for_each = toset(["first-","second-", "third-"])
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "${each.key}module-s3-from-registry"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}