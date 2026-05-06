## 2024-05-06 - Terragrunt Provider Cache vs Terraform Plugin Cache
**Learning:** In a multi-module Terragrunt setup (like this 28-module Proxmox cluster), using Terraform's `TF_PLUGIN_CACHE_DIR` causes concurrent provider download lock errors and redundant downloads during `terragrunt run-all`.
**Action:** Use Terragrunt's native provider cache (`TERRAGRUNT_PROVIDER_CACHE=1`) instead to safely and efficiently handle concurrent downloads across all root modules.
