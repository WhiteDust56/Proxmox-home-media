## 2026-07-02 - Terragrunt Provider Caching for Concurrent Operations
**Learning:** Terraform's native `TF_PLUGIN_CACHE_DIR` struggles with race conditions during concurrent provider downloads in `terragrunt run-all` operations, leading to failed builds or redundant downloads.
**Action:** Always use Terragrunt's native provider caching (`TERRAGRUNT_PROVIDER_CACHE=1` and `TERRAGRUNT_PROVIDER_CACHE_DIR`) in CI/CD pipelines to ensure thread-safe caching, avoid path mismatches by using workspace-relative paths, and improve concurrent validation performance.
