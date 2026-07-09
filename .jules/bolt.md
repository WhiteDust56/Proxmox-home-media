## 2024-05-23 - Terraform Provider Caching with Terragrunt
**Learning:** In a codebase with multiple Terraform root modules managed by Terragrunt (like the 28 modules in this repo), running `terragrunt run-all` causes Terraform to individually download the provider for *each* module. This results in significant network overhead, rate limits (like GitHub API timeouts when downloading the proxmox provider), and incredibly slow CI runs.
**Action:** Always enable `TF_PLUGIN_CACHE_DIR` when using Terragrunt with multiple modules, especially in CI environments, to download providers once and link them, speeding up execution drastically.
## 2024-07-09 - Terragrunt Native Provider Caching
**Learning:** Using Terraform's TF_PLUGIN_CACHE_DIR with terragrunt run-all can cause race conditions, corrupt installations, and redundant downloads during concurrent execution. Terragrunt's native provider cache is safer and faster. Additionally, using ~/ in GitHub Actions env blocks does not expand, causing path mismatches.
**Action:** Use TERRAGRUNT_PROVIDER_CACHE=1 and TERRAGRUNT_PROVIDER_CACHE_DIR set to ${{ github.workspace }}/.cache/terragrunt/providers for reliable concurrent caching in CI.
