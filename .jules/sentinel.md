## 2026-07-19 - Privileged LXC Containers Default in Proxmox
**Vulnerability:** Found multiple Proxmox LXC containers deployed without the `unprivileged = true` setting, which defaults them to privileged mode.
**Learning:** In Proxmox, LXC containers are created as privileged by default. This can be a significant security risk as it allows processes inside the container to map to the root user on the host, increasing the risk of a container breakout.
**Prevention:** Always explicitly set `unprivileged = true` when defining `proxmox_virtual_environment_container` resources to follow the principle of least privilege.
