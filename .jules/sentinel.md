## 2024-07-23 - Prevent Privileged LXC Container Breakout
**Vulnerability:** Found Proxmox LXC containers deployed without the `unprivileged = true` flag. By default, Proxmox creates containers as privileged.
**Learning:** Privileged containers map the root user inside the container directly to the root user on the host system, creating a critical risk of container breakout if the container is compromised.
**Prevention:** Always explicitly set `unprivileged = true` for `proxmox_virtual_environment_container` resources unless strictly necessary for specific workloads (like NFS mounts).
