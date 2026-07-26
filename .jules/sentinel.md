## 2024-05-26 - Privileged LXC Containers Resource Replacement
**Vulnerability:** Changing existing Proxmox LXC containers from privileged (default) to unprivileged (`unprivileged = true`).
**Learning:** In Terraform, changing the `unprivileged` flag forces a resource replacement (destroy and recreate). This conflicts with `prevent_destroy = true` lifecycle rules and breaks running workloads.
**Prevention:** Do not attempt to transition existing privileged LXC containers to unprivileged in Terraform without a coordinated migration plan that accounts for state destruction.
