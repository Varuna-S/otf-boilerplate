terraform {
  backend "s3" {
    # Make sure to set AWS_PROFILE environment variable for automatic authentication
    bucket                 = "add-bucket-name-here"
    key                    = "path/to/key"
    region                 = local.region
    encrypt                = true # SSE-S3 at rest, underneath the client-side layer below
    use_lockfile           = true # native S3 locking, no DynamoDB table needed
    use_dualstack_endpoint = true
    state_tags = {
      "type" : "state"
    }
    lock_tags = {
      "type" : "lock"
    }
  }

  # State and plan are encrypted client-side
  encryption {
    key_provider "pbkdf2" "default" {
      passphrase = var.encryption_passphrase
    }

    method "aes_gcm" "default" {
      keys = key_provider.pbkdf2.default
    }

    state {
      method = method.aes_gcm.default
      # enforced = true makes OpenTofu refuse to write plaintext rather than
      # silently falling back to it
      enforced = true
    }

    plan {
      method   = method.aes_gcm.default
      enforced = true
    }

  }
}
