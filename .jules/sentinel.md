## 2026-07-18 - Enforce Unprivileged LXC Containers
**Vulnerability:** Proxmox creates LXC containers as privileged by default. Privileged containers run as host root, increasing breakout risk.
**Learning:** Default configurations in Proxmox provider can silently violate the principle of least privilege.
**Prevention:** Always explicitly set `unprivileged = true` for `proxmox_virtual_environment_container` resources unless strictly required.
