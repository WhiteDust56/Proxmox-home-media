## 2026-06-15 - Terragrunt Provider Caching for Concurrent Inits
**Learning:** Using `TF_PLUGIN_CACHE_DIR` with `terragrunt run-all` on multi-module structures (28+ modules) causes concurrent download race conditions and redundant downloads.
**Action:** Use Terragrunt's native `TERRAGRUNT_PROVIDER_CACHE=1` and `TERRAGRUNT_PROVIDER_CACHE_DIR` instead to speed up concurrent `init` runs and avoid race conditions.
