## 2024-06-25 - Prevent concurrent provider download corruption
**Learning:** The pipeline fails frequently because Terraform's native `TF_PLUGIN_CACHE_DIR` causes race conditions and corrupted provider installations when multiple Terragrunt modules download providers concurrently.
**Action:** Switched to Terragrunt's native provider cache (`TERRAGRUNT_PROVIDER_CACHE=1`) and directed it to `${{ github.workspace }}/.cache/terragrunt/providers`. This ensures thread-safe caching and prevents redundant downloads.
