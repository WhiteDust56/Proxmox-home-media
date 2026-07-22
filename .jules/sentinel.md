## 2024-07-23 - Enforce Unprivileged LXC Containers
**Vulnerability:** Proxmox LXC containers were configured as privileged by default, missing the `unprivileged = true` setting.
**Learning:** By default, Proxmox creates privileged containers, which map container root to host root. This is a severe security risk as container breakout could lead to full host compromise.
**Prevention:** Always explicitly set `unprivileged = true` for `proxmox_virtual_environment_container` resources unless there is a specific, documented requirement for privileged access (e.g., accessing specific host hardware directly).
