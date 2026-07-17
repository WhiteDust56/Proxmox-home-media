## 2024-05-23 - Terraform Provider Caching with Terragrunt
**Learning:** In a codebase with multiple Terraform root modules managed by Terragrunt (like the 28 modules in this repo), running `terragrunt run-all` causes Terraform to individually download the provider for *each* module. This results in significant network overhead, rate limits (like GitHub API timeouts when downloading the proxmox provider), and incredibly slow CI runs.
**Action:** Always enable `TF_PLUGIN_CACHE_DIR` when using Terragrunt with multiple modules, especially in CI environments, to download providers once and link them, speeding up execution drastically.
## 2024-07-17 - Avoid TF_PLUGIN_CACHE_DIR with concurrent Terragrunt runs
**Learning:** Using `TF_PLUGIN_CACHE_DIR` with `terragrunt run-all` can cause race conditions and corrupt provider installations during concurrent module downloads.
**Action:** Use Terragrunt's native provider cache (`TERRAGRUNT_PROVIDER_CACHE=1`) instead to ensure safe, concurrent caching, which significantly speeds up CI execution times safely.
