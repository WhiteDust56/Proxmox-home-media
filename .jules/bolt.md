## 2024-05-23 - Terraform Provider Caching with Terragrunt
**Learning:** In a codebase with multiple Terraform root modules managed by Terragrunt (like the 28 modules in this repo), running `terragrunt run-all` causes Terraform to individually download the provider for *each* module. This results in significant network overhead, rate limits (like GitHub API timeouts when downloading the proxmox provider), and incredibly slow CI runs.
**Action:** Always enable `TF_PLUGIN_CACHE_DIR` when using Terragrunt with multiple modules, especially in CI environments, to download providers once and link them, speeding up execution drastically.

## 2025-02-12 - Terragrunt Provider Caching
**Learning:** In a multi-module Terragrunt setup, native Terraform caching (`TF_PLUGIN_CACHE_DIR`) can encounter issues and race conditions with concurrent provider downloads during `terragrunt run-all`.
**Action:** Use Terragrunt's native caching by setting `TERRAGRUNT_PROVIDER_CACHE=1` and `TERRAGRUNT_PROVIDER_CACHE_DIR` instead, which properly handles concurrency and speeds up infrastructure validation and deployment without hitting provider registry rate limits.
