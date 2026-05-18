## 2024-05-24 - Terragrunt Provider Caching Concurrency
**Learning:** Terraform's default `TF_PLUGIN_CACHE_DIR` fails with race conditions and redundant downloads when running `terragrunt run-all` across many modules concurrently.
**Action:** Use Terragrunt's native `TERRAGRUNT_PROVIDER_CACHE=1` and set `TERRAGRUNT_PROVIDER_CACHE_DIR` to a workspace-local `.cache/` directory to ensure thread-safe caching and optimize CI pipeline execution times.
