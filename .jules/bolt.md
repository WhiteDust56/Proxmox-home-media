## 2024-07-25 - Prevent concurrent Terraform provider download race conditions
**Learning:** Using Terraform's `TF_PLUGIN_CACHE_DIR` with Terragrunt concurrent execution (`run-all`) can cause race conditions and corrupt provider installations.
**Action:** Use Terragrunt's native provider cache via `TERRAGRUNT_PROVIDER_CACHE=1` and `TERRAGRUNT_PROVIDER_CACHE_DIR` set to a workspace-local `.cache/` directory to improve reliability and performance.
