## 2026-06-06 - Use Terragrunt provider cache
**Learning:** Initializing many root modules concurrently with Terraform's standard TF_PLUGIN_CACHE_DIR causes race conditions and redundant downloads.
**Action:** Use Terragrunt's native provider cache (via TERRAGRUNT_PROVIDER_CACHE=1 and TERRAGRUNT_PROVIDER_CACHE_DIR) to prevent redundant downloads and corrupt installations during concurrent provider downloads.
