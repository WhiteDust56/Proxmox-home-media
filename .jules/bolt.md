## 2024-05-23 - Terraform Provider Caching with Terragrunt
**Learning:** In a codebase with multiple Terraform root modules managed by Terragrunt (like the 28 modules in this repo), running `terragrunt run-all` causes Terraform to individually download the provider for *each* module. This results in significant network overhead, rate limits (like GitHub API timeouts when downloading the proxmox provider), and incredibly slow CI runs.
**Action:** Always enable `TF_PLUGIN_CACHE_DIR` when using Terragrunt with multiple modules, especially in CI environments, to download providers once and link them, speeding up execution drastically.
## 2026-06-02 - Terragrunt Provider Caching
**Learning:** Using Terraform's `TF_PLUGIN_CACHE_DIR` with concurrent terragrunt runs causes race conditions and redundant downloads. Terragrunt provides a native cache using `TERRAGRUNT_PROVIDER_CACHE=1` to solve this specific bottleneck.
**Action:** Always use `TERRAGRUNT_PROVIDER_CACHE=1` and `TERRAGRUNT_PROVIDER_CACHE_DIR` pointing to an explicit workspace path (e.g., `${{ github.workspace }}/.cache/terragrunt/providers`) instead of standard Terraform caching for Terragrunt projects.
