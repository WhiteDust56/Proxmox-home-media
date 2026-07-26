## 2024-05-23 - Terraform Provider Caching with Terragrunt
**Learning:** In a codebase with multiple Terraform root modules managed by Terragrunt (like the 28 modules in this repo), running `terragrunt run-all` causes Terraform to individually download the provider for *each* module. This results in significant network overhead, rate limits (like GitHub API timeouts when downloading the proxmox provider), and incredibly slow CI runs.
**Action:** Always enable `TF_PLUGIN_CACHE_DIR` when using Terragrunt with multiple modules, especially in CI environments, to download providers once and link them, speeding up execution drastically.
## 2026-07-26 - Terragrunt Native Provider Caching
**Learning:** Using Terraform's `TF_PLUGIN_CACHE_DIR` with concurrent `terragrunt run-all` modules can lead to race conditions and corrupt provider installations. Terragrunt provides a native caching mechanism via a local proxy that is safer and faster.
**Action:** Use `TERRAGRUNT_PROVIDER_CACHE=1` instead of `TF_PLUGIN_CACHE_DIR`, and explicitly define `TERRAGRUNT_PROVIDER_CACHE_DIR` (e.g., using `${{ github.workspace }}/.cache/terragrunt/providers` in GitHub Actions) to prevent path mismatches.
