variable "project" {
  type        = string
  description = "Project identifier applied to the default tags on every resource."
}

variable "encryption_passphrase" {
  type        = string
  description = <<-DESC
    Passphrase used to derive the state and plan encryption key.

    Generate with `openssl rand -hex 32` 
    export TF_VAR_encryption_passphrase="..."
  DESC
  sensitive   = true

  validation {
    condition     = length(var.encryption_passphrase) >= 32
    error_message = "encryption_passphrase must be at least 32 characters"
  }
}
