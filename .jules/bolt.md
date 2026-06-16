## 2026-06-16 - Prevent race conditions in parallel Terragrunt provider downloads
**Learning:** Terraform's `TF_PLUGIN_CACHE_DIR` is inefficient with `terragrunt run-all` because parallel module executions can cause race conditions or redundant provider downloads to the shared plugin cache directory.
**Action:** Always use Terragrunt's native provider cache (`TERRAGRUNT_PROVIDER_CACHE=1` and `TERRAGRUNT_PROVIDER_CACHE_DIR`) instead. This allows Terragrunt to safely coordinate caching across parallel worker processes.
