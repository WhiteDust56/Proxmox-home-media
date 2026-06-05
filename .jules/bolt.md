## 2024-05-23 - Terraform Provider Caching with Terragrunt
**Learning:** In a codebase with multiple Terraform root modules managed by Terragrunt (like the 28 modules in this repo), running `terragrunt run-all` causes Terraform to individually download the provider for *each* module. This results in significant network overhead, rate limits (like GitHub API timeouts when downloading the proxmox provider), and incredibly slow CI runs.
**Action:** Always enable `TF_PLUGIN_CACHE_DIR` when using Terragrunt with multiple modules, especially in CI environments, to download providers once and link them, speeding up execution drastically.

## 2024-06-05 - Optimize CI by using Terragrunt's native provider cache
**Learning:** Using Terraform's TF_PLUGIN_CACHE_DIR with concurrent module runs in Terragrunt can lead to redundant downloads, race conditions, or corrupt provider installations.
**Action:** Use Terragrunt's native TERRAGRUNT_PROVIDER_CACHE=1 and TERRAGRUNT_PROVIDER_CACHE_DIR instead to properly handle concurrent downloads.
