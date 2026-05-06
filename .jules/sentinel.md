## 2026-05-06 - [High] Fix privileged LXC container
**Vulnerability:** Privileged LXC Container Configuration
**Learning:** Running LXC containers in privileged mode maps the container's root user to the host's root user, allowing for a potential container escape to compromise the host system.
**Prevention:** Always enforce unprivileged mode for LXC containers in Proxmox by setting `unprivileged = true` to ensure the container's root user maps to an unprivileged user on the host.
