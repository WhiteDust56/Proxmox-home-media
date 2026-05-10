## 2024-05-18 - Terragrunt Native Provider Cache
**Learning:** Using Terraform's `TF_PLUGIN_CACHE_DIR` with Terragrunt across multiple root modules can lead to redundant downloads and concurrent provider download lock errors in CI.
**Action:** Use Terragrunt's native provider caching (`TERRAGRUNT_PROVIDER_CACHE=1` and `TERRAGRUNT_PROVIDER_CACHE_DIR`) to handle parallel processing safely and improve speed.
