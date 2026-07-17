## 2024-07-16 - [Proxmox LXC] Privileged Containers
**Vulnerability:** Several LXC containers were not explicitly marked as `unprivileged = true`. In Proxmox, LXC containers are created as privileged by default.
**Learning:** Privileged containers run the root user inside the container as the root user on the host. This allows an attacker who breaks out of the container to potentially gain full root access to the host system (container breakout).
**Prevention:** Always explicitly set `unprivileged = true` for `proxmox_virtual_environment_container` resources in Terraform to follow the principle of least privilege and map container root to an unprivileged user on the host.
