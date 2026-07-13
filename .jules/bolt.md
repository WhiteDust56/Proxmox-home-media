## 2024-05-23 - Terraform Provider Caching with Terragrunt
**Learning:** In a codebase with multiple Terraform root modules managed by Terragrunt (like the 28 modules in this repo), running `terragrunt run-all` causes Terraform to individually download the provider for *each* module. This results in significant network overhead, rate limits (like GitHub API timeouts when downloading the proxmox provider), and incredibly slow CI runs.
**Action:** Always enable `TF_PLUGIN_CACHE_DIR` when using Terragrunt with multiple modules, especially in CI environments, to download providers once and link them, speeding up execution drastically.

## 2026-07-13 - Terragrunt Provider Caching
**Learning:** Using `TF_PLUGIN_CACHE_DIR` with Terragrunt across many modules can cause race conditions and slow down CI due to redundant provider downloads or corrupt caching. Terragrunt provides a native proxy via `TERRAGRUNT_PROVIDER_CACHE=1`.
**Action:** Always use `TERRAGRUNT_PROVIDER_CACHE=1` and `TERRAGRUNT_PROVIDER_CACHE_DIR` instead of Terraform's built-in cache directory when working with Terragrunt to dramatically speed up multi-module provider downloads in CI.
