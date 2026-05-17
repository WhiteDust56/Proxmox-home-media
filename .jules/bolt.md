## 2024-11-20 - Terragrunt Provider Caching in GitHub Actions
**Learning:** Using Terraform's `TF_PLUGIN_CACHE_DIR` with Terragrunt across multiple modules causes concurrent download issues, and path variables like `$HOME` in GitHub Actions `env` blocks don't expand, leading to empty cache backups.
**Action:** Use Terragrunt's native cache (`TERRAGRUNT_PROVIDER_CACHE=1`) and explicitly set cache directories using `${{ github.workspace }}`.
