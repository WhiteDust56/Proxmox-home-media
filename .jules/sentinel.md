## 2024-05-08 - Fixed Privileged LXC Containers
**Vulnerability:** Found multiple Proxmox LXC containers configured without explicit `unprivileged = true` setting. Privileged containers map the root user inside the container directly to the root user on the Proxmox host, posing a significant risk of host compromise if the container is breached.
**Learning:** Default configurations or imported templates might omit the `unprivileged` flag, unintentionally creating privileged containers.
**Prevention:** Always explicitly set `unprivileged = true` in all `proxmox_virtual_environment_container` resource blocks. This maps the container's root user to an unprivileged user on the host, adhering to the principle of least privilege and providing defense in depth.
