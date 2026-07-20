## 2026-07-20 - Ensure Proxmox LXC containers are unprivileged
**Vulnerability:** Found multiple `proxmox_virtual_environment_container` resources missing the `unprivileged = true` flag.
**Learning:** In Proxmox, LXC containers run as privileged by default if this flag is not explicitly set, which is a severe container breakout risk.
**Prevention:** Always ensure `unprivileged = true` is explicitly set on all LXC resources to adhere to the principle of least privilege.
