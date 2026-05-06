## 2024-05-06 - Privileged LXC Container Vulnerability Fix
**Vulnerability:** Proxmox LXC containers deployed without explicitly setting `unprivileged = true` run in privileged mode by default. This maps the container's root user directly to the host's root user. If a privileged container is compromised, the host is fully compromised.
**Learning:** Found multiple instances of `proxmox_virtual_environment_container` resources lacking the `unprivileged = true` setting.
**Prevention:** Ensure that all Proxmox LXC container configurations include `unprivileged = true` to maintain isolation from the host. Implement checks during code review or use tools like tfsec to automatically flag missing `unprivileged` attributes.
