## 2024-05-23 - Terraform Provider Caching with Terragrunt
**Learning:** In a codebase with multiple Terraform root modules managed by Terragrunt (like the 28 modules in this repo), running `terragrunt run-all` causes Terraform to individually download the provider for *each* module. This results in significant network overhead, rate limits (like GitHub API timeouts when downloading the proxmox provider), and incredibly slow CI runs.
**Action:** Always enable `TF_PLUGIN_CACHE_DIR` when using Terragrunt with multiple modules, especially in CI environments, to download providers once and link them, speeding up execution drastically.

## 2026-07-19 - Terragrunt Provider Caching Performance
**Learning:** Using Terraform's `TF_PLUGIN_CACHE_DIR` with Terragrunt concurrent initialization causes redundant downloads, race conditions, and misses caches due to path mismatches in CI pipelines. Terragrunt's native caching (`TERRAGRUNT_PROVIDER_CACHE=1`) avoids this and significantly speeds up CI execution times, but requires ignoring dynamically generated `.terraformrc` files.
**Action:** Always use Terragrunt native caching with explicit cache paths (e.g., `.cache/terragrunt/providers`) instead of `TF_PLUGIN_CACHE_DIR` in CI pipelines.
