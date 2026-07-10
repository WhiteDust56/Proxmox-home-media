## 2026-07-10 - Optimizing Terragrunt Provider Downloads
**Learning:** Using Terraform's `TF_PLUGIN_CACHE_DIR` with Terragrunt concurrent executions causes redundant downloads and potential race conditions.
**Action:** Always use Terragrunt's native provider cache (`TERRAGRUNT_PROVIDER_CACHE=1`) and explicitly set `TERRAGRUNT_PROVIDER_CACHE_DIR` to a workspace-local `.cache/` directory in CI to improve concurrency performance and reliability.
