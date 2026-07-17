## 2024-05-23 - Terraform Provider Caching with Terragrunt
**Learning:** In a codebase with multiple Terraform root modules managed by Terragrunt (like the 28 modules in this repo), running `terragrunt run-all` causes Terraform to individually download the provider for *each* module. This results in significant network overhead, rate limits (like GitHub API timeouts when downloading the proxmox provider), and incredibly slow CI runs.
**Action:** Always enable `TF_PLUGIN_CACHE_DIR` when using Terragrunt with multiple modules, especially in CI environments, to download providers once and link them, speeding up execution drastically.

## 2026-07-16 - Terragrunt Native Provider Caching
**Learning:** When using `TF_PLUGIN_CACHE_DIR` with `terragrunt run-all`, race conditions can occur during concurrent provider downloads, sometimes leading to corrupt installations. Additionally, Terraform's default caching may still result in redundant API calls.
**Action:** Use Terragrunt's native caching via `TERRAGRUNT_PROVIDER_CACHE=1` and `TERRAGRUNT_PROVIDER_CACHE_DIR`. This explicitly manages a local provider registry proxy, preventing redundant downloads and avoiding race conditions during concurrent `terragrunt run-all` executions.
