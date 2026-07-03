## 2026-07-03 - Terragrunt Provider Cache Optimization
**Learning:** Using `TF_PLUGIN_CACHE_DIR` with Terragrunt `run-all` causes race conditions and redundant downloads during concurrent execution of child modules.
**Action:** Always use Terragrunt's native provider cache via `TERRAGRUNT_PROVIDER_CACHE=1` and set `TERRAGRUNT_PROVIDER_CACHE_DIR` to a workspace-local directory (e.g., `${{ github.workspace }}/.cache/terragrunt/providers`) to ensure fast and safe concurrent provider downloads in GitHub Actions.
