## 2024-05-23 - Terraform Provider Caching with Terragrunt
**Learning:** In a codebase with multiple Terraform root modules managed by Terragrunt (like the 28 modules in this repo), running `terragrunt run-all` causes Terraform to individually download the provider for *each* module. This results in significant network overhead, rate limits (like GitHub API timeouts when downloading the proxmox provider), and incredibly slow CI runs.
**Action:** Always enable `TF_PLUGIN_CACHE_DIR` when using Terragrunt with multiple modules, especially in CI environments, to download providers once and link them, speeding up execution drastically.

## 2024-07-22 - Terragrunt Native Provider Caching
**Learning:** TF_PLUGIN_CACHE_DIR can cause race conditions and corrupt installations when using Terragrunt with concurrent multiple modules in CI.
**Action:** Use Terragrunt's native provider cache (TERRAGRUNT_PROVIDER_CACHE=1) instead to safely and efficiently manage concurrent provider downloads in GitHub Actions.
