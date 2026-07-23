## 2024-05-23 - Terraform Provider Caching with Terragrunt
**Learning:** In a codebase with multiple Terraform root modules managed by Terragrunt (like the 28 modules in this repo), running `terragrunt run-all` causes Terraform to individually download the provider for *each* module. This results in significant network overhead, rate limits (like GitHub API timeouts when downloading the proxmox provider), and incredibly slow CI runs.
**Action:** Always enable `TF_PLUGIN_CACHE_DIR` when using Terragrunt with multiple modules, especially in CI environments, to download providers once and link them, speeding up execution drastically.

## 2024-07-24 - Terragrunt Native Provider Caching
**Learning:** Using Terraform's `TF_PLUGIN_CACHE_DIR` with Terragrunt causes redundant concurrent downloads and race conditions during CI runs because multiple modules run concurrently. Terragrunt's native cache (`TERRAGRUNT_PROVIDER_CACHE=1`) avoids this by dynamically creating a proxy server for downloading providers, significantly speeding up execution and preventing corruptions.
**Action:** Always use `TERRAGRUNT_PROVIDER_CACHE=1` and `TERRAGRUNT_PROVIDER_CACHE_DIR` instead of `TF_PLUGIN_CACHE_DIR` in GitHub Actions for Terragrunt, using `${{ github.workspace }}` for paths to avoid mismatches. Ensure `.cache/` and `.terraformrc` are in `.gitignore`.
