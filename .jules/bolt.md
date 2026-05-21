## 2024-05-23 - Terraform Provider Caching with Terragrunt
**Learning:** In a codebase with multiple Terraform root modules managed by Terragrunt (like the 28 modules in this repo), running `terragrunt run-all` causes Terraform to individually download the provider for *each* module. This results in significant network overhead, rate limits (like GitHub API timeouts when downloading the proxmox provider), and incredibly slow CI runs.
**Action:** Always enable `TF_PLUGIN_CACHE_DIR` when using Terragrunt with multiple modules, especially in CI environments, to download providers once and link them, speeding up execution drastically.

## 2024-05-21 - Optimize CI caching with Terragrunt native provider cache
**Learning:** Terraform's `TF_PLUGIN_CACHE_DIR` does not handle concurrent provider downloads safely across multiple modules run by Terragrunt in a CI environment, leading to redundant downloads or cache corruption. Additionally, GitHub Actions `env` block doesn't expand shell variables like `${HOME}`, requiring context variables like `${{ github.workspace }}`.
**Action:** Use Terragrunt's native provider caching mechanism via the `TERRAGRUNT_PROVIDER_CACHE=1` and `TERRAGRUNT_PROVIDER_CACHE_DIR=${{ github.workspace }}/.cache/terragrunt/providers` environment variables to ensure safe, concurrent downloads and reliable caching.
