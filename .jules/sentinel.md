## 2024-07-22 - Default Privileged Proxmox Containers
**Vulnerability:** Proxmox virtual environment containers (LXC) were being deployed as privileged by default.
**Learning:** Proxmox's default behavior creates containers where root inside the container is equivalent to root on the host, increasing the risk of a container breakout.
**Prevention:** Always explicitly set `unprivileged = true` for LXC container definitions to enforce strict user namespace mapping.
