## 2024-07-16 - Prevent Privileged LXC Containers
**Vulnerability:** Five LXC containers in the Proxmox cluster (118, 109, 112, 117, 104) were missing the `unprivileged = true` flag. By default, Proxmox creates containers as privileged. If a privileged container is compromised, the attacker gains root access to the underlying Proxmox host.
**Learning:** Default settings for Proxmox containers in Terraform do not enforce unprivileged mode.
**Prevention:** Ensure that `unprivileged = true` is explicitly defined for all LXC containers to follow the principle of least privilege.
