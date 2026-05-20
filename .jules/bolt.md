## 2024-05-23 - Terraform Provider Caching with Terragrunt
**Learning:** In a codebase with multiple Terraform root modules managed by Terragrunt (like the 28 modules in this repo), running `terragrunt run-all` causes Terraform to individually download the provider for *each* module. This results in significant network overhead, rate limits (like GitHub API timeouts when downloading the proxmox provider), and incredibly slow CI runs.
**Action:** Always enable `TF_PLUGIN_CACHE_DIR` when using Terragrunt with multiple modules, especially in CI environments, to download providers once and link them, speeding up execution drastically.
## 2024-05-23 - Caching concurrency with Terragrunt
**Learning:** While `TF_PLUGIN_CACHE_DIR` helps save download time, when Terragrunt initiates concurrent downloads across multiple modules it can lead to corrupt archives and failed states.
**Action:** Use Terragrunt's native `TERRAGRUNT_PROVIDER_CACHE=1` to safely manage concurrent provider downloads and use `${{ github.workspace }}` for cache paths in CI to ensure valid caching.
