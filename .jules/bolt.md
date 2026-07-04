## 2024-05-23 - Terraform Provider Caching with Terragrunt
**Learning:** In a codebase with multiple Terraform root modules managed by Terragrunt (like the 28 modules in this repo), running `terragrunt run-all` causes Terraform to individually download the provider for *each* module. This results in significant network overhead, rate limits (like GitHub API timeouts when downloading the proxmox provider), and incredibly slow CI runs.
**Action:** Always enable `TF_PLUGIN_CACHE_DIR` when using Terragrunt with multiple modules, especially in CI environments, to download providers once and link them, speeding up execution drastically.

## 2024-11-20 - Terragrunt Native Provider Cache vs TF_PLUGIN_CACHE_DIR
**Learning:** `TF_PLUGIN_CACHE_DIR` causes race conditions and redundant downloads during concurrent execution with `terragrunt run-all`. Terragrunt's native provider caching is significantly faster and more reliable as it properly handles concurrency and avoids corrupt installations.
**Action:** Use `TERRAGRUNT_PROVIDER_CACHE=1` and `TERRAGRUNT_PROVIDER_CACHE_DIR` instead of Terraform's plugin cache to safely parallelize provider caching.
