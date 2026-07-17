## 2024-07-17 - Enforce Unprivileged LXC Containers
**Vulnerability:** Several LXC containers in the Proxmox configuration were missing the `unprivileged = true` setting, causing them to run as privileged containers, which poses a severe container breakout risk.
**Learning:** In Proxmox Terraform configurations, LXC containers are created as privileged by default.
**Prevention:** Always ensure `unprivileged = true` is explicitly set to follow the principle of least privilege.
