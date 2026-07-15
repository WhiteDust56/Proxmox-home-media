## 2024-05-23 - Terraform Provider Caching with Terragrunt
**Learning:** In a codebase with multiple Terraform root modules managed by Terragrunt (like the 28 modules in this repo), running `terragrunt run-all` causes Terraform to individually download the provider for *each* module. This results in significant network overhead, rate limits (like GitHub API timeouts when downloading the proxmox provider), and incredibly slow CI runs.
**Action:** Always enable `TF_PLUGIN_CACHE_DIR` when using Terragrunt with multiple modules, especially in CI environments, to download providers once and link them, speeding up execution drastically.

## 2026-07-15 - Native Terragrunt Provider Caching
**Learning:** Terragrunt has a native provider cache feature (`TERRAGRUNT_PROVIDER_CACHE=1`) that supersedes Terraform's `TF_PLUGIN_CACHE_DIR`. It is far more efficient in a multi-module Terragrunt setup as it intercepts provider downloads and serves them from a local proxy cache directory, avoiding redundant downloads and saving significant time during `terragrunt run-all`.
**Action:** Use `TERRAGRUNT_PROVIDER_CACHE=1` and `TERRAGRUNT_PROVIDER_CACHE_DIR` instead of Terraform's plugin cache for all Terragrunt multi-module setups to significantly boost CI validation speed.
