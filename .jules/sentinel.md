## 2024-05-24 - Fix Unprivileged LXC Containers
**Vulnerability:** Proxmox LXC containers are created as privileged by default when missing the `unprivileged = true` setting.
**Learning:** Missing `unprivileged = true` enables container breakout risks, giving the root user in the container root privileges on the host.
**Prevention:** Always explicitly set `unprivileged = true` in Proxmox LXC terraform definitions.
