## 2024-05-23 - Terraform Provider Caching with Terragrunt
**Learning:** In a codebase with multiple Terraform root modules managed by Terragrunt (like the 28 modules in this repo), running `terragrunt run-all` causes Terraform to individually download the provider for *each* module. This results in significant network overhead, rate limits (like GitHub API timeouts when downloading the proxmox provider), and incredibly slow CI runs.
**Action:** Always enable `TF_PLUGIN_CACHE_DIR` when using Terragrunt with multiple modules, especially in CI environments, to download providers once and link them, speeding up execution drastically.

## 2024-05-19 - Concurrent Provider Downloads Optimization
**Learning:** In CI environments with concurrent module execution (like `terragrunt run-all`), using Terraform's `TF_PLUGIN_CACHE_DIR` can lead to collisions or redundant downloads if not managed perfectly. Terragrunt provides its own native cache via `TERRAGRUNT_PROVIDER_CACHE=1`, which handles concurrency safely and reduces overall download times significantly when spanning multiple child modules.
**Action:** Always enable `TERRAGRUNT_PROVIDER_CACHE` with a locally scoped directory like `${{ github.workspace }}/.cache/...` inside GitHub Action workflows for Terragrunt projects.
