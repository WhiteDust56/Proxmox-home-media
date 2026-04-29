# Proxmox Home Media Cluster

This repository contains the Terraform and Terragrunt configuration for managing the Proxmox Home Media cluster.

## Structure
The project is divided into separate directories for every VM and LXC instance.
- `pve1/vm_100/main.tf`
- `pve1/lxc_105/main.tf`
- ...

## Terragrunt Usage
Because there are 28 separate root modules, Terragrunt is highly recommended to manage the state and provider blocks uniformly without repeating credentials everywhere.

The `terragrunt.hcl` root file handles generating the `provider.tf` files for all children automatically.

To apply changes cluster-wide, install terragrunt and simply run:
```bash
export TF_VAR_proxmox_endpoint="https://10.0.0.1:8006/"
export TF_VAR_proxmox_api_token="user@pam!token=uuid"
terragrunt run-all plan
```

## Import Strategy
Each directory contains a `main.tf` which holds the FULLY POPULATED Terraform Resource logic to manage the system (including memory, cpu, disks, and network mappings extracted from the native `.conf` files), and an `import` block to safely bring the system under Terraform management.

Every module explicitly has `prevent_destroy = true`. This enforces complete safety: when you run `terraform apply`, Terraform is functionally blocked from altering or destroying the instances.
