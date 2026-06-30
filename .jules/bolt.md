## 2024-05-23 - Terraform Provider Caching with Terragrunt
**Learning:** In a codebase with multiple Terraform root modules managed by Terragrunt (like the 28 modules in this repo), running `terragrunt run-all` causes Terraform to individually download the provider for *each* module. This results in significant network overhead, rate limits (like GitHub API timeouts when downloading the proxmox provider), and incredibly slow CI runs.
**Action:** Always enable `TF_PLUGIN_CACHE_DIR` when using Terragrunt with multiple modules, especially in CI environments, to download providers once and link them, speeding up execution drastically.

## 2026-06-30 - Terragrunt Native Provider Caching
**Learning:** While `TF_PLUGIN_CACHE_DIR` helps with single-module Terraform configurations, using it with `terragrunt run-all` (which runs concurrently) often causes race conditions and redundant downloads because Terraform itself doesn't lock cache directories safely during concurrent module initialization.
**Action:** Use Terragrunt's native provider cache feature (`TERRAGRUNT_PROVIDER_CACHE=1` and `TERRAGRUNT_PROVIDER_CACHE_DIR`) instead of Terraform's cache. This prevents race conditions, reduces redundant downloads across concurrent modules, and significantly speeds up CI execution.
