terraform {
    backend "s3" {
        encrypt = true
    }
}

provider "aws" {
  region = local.region

  # Make it faster by skipping something
  skip_get_ec2_platforms      = true
  skip_metadata_api_check     = true
  skip_region_validation      = true
  skip_credentials_validation = true
  skip_requesting_account_id  = true
}


resource "random_pet" "this" {
  length = 2
}


module "enm-s3-buckets" { #
  source = "../../core/modules/s3/bucket"
  count  = length(var.enm_bucket_names)
  bucket = "${var.env}-${var.location-prefix}-${local.enm_bucket_prefix}-${var.enm_bucket_names[count.index]}"

  force_destroy = true
  tags = {
    env       = var.env
    location  = var.location-prefix
    capability = local.capability
  }
}