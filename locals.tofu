locals {
  # Default tags that will be applied on every resource
  default_tags = {
    project        = var.project
    provisioned_by = "otf"
  }
  region = "ap-south-1"
}