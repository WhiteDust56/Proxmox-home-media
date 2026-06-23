## 2024-05-23 - Terraform Provider Caching with Terragrunt
**Learning:** In a codebase with multiple Terraform root modules managed by Terragrunt (like the 28 modules in this repo), running `terragrunt run-all` causes Terraform to individually download the provider for *each* module. This results in significant network overhead, rate limits (like GitHub API timeouts when downloading the proxmox provider), and incredibly slow CI runs.
**Action:** Always enable `TF_PLUGIN_CACHE_DIR` when using Terragrunt with multiple modules, especially in CI environments, to download providers once and link them, speeding up execution drastically.
## 2024-06-23 - Concurrency Safety with Terragrunt Caching
**Learning:** While `TF_PLUGIN_CACHE_DIR` reduces downloads, it can cause race conditions during concurrent `terragrunt run-all` executions, leading to corrupt installations or failures.
**Action:** Always prefer Terragrunt's native provider caching (`TERRAGRUNT_PROVIDER_CACHE=1`) over Terraform's native caching when using Terragrunt, as it safely handles concurrent provider downloads.
