# otf-boilerplate

## Setup

### Prerequisites

Install the following tools:
- [OpenTofu](https://opentofu.org/docs/intro/install/)
- [betterleaks](https://github.com/betterleaks/betterleaks)
- [direnv](https://direnv.net/) (Optional)

Environment variables:
- `TF_PLUGIN_CACHE_DIR` - Path to the plugin cache directory
- `AWS_PROFILE` - AWS profile to use

### Getting started

1. Remove the existing git history, initialize new
    ```bash
    rm -rf .git && git init
    ```  
2. Run to configure git hooks <br>
    ```bash
    git config core.hooksPath .githooks
    ```
3. `versions.tofu` 
    - Update the OpenTofu version
    - Add new required providers if required
    - Update provider(s) version constraints to their latest version
4. `providers.tofu`
    - Add new provider configurations if required
5. `locals.tofu`
    - Update the default tags
6. `backend.tofu`
    - Replace the bucket name with actual value in backend block
    - Update the key path where the state files are stored inside the bucket
7. `terraform.tfvars`
    - Copy the example file
        ```bash
        cp terraform.tfvars.example terraform.tfvars
        ```
    - Generate an encryption passphrase and set `encryption_passphrase`
        ```bash
        openssl rand -hex 32
        ```
    - Set `project` to your project name

    > [!WARNING]
    > `terraform.tfvars` is gitignored and must never be committed. Use a
    > different passphrase for every environment and store it in your secret
    > manager. If it is lost, the state and plan files cannot be decrypted.

8. Initialize OpenTofu
    ```bash
    tofu init
    ```

    > [!NOTE]
    > If you are using the S3 backend, the bucket configured in `backend.tofu`
    > must already exist before running `tofu init`.

