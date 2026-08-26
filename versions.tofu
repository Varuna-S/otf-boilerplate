language {
  compatible_with {
    opentofu = ">= 1.12"
  }
}

terraform {
  required_providers {
    aws = {
      source  = "opentofu/aws"
      version = "6.61.0"
    }
  }
}