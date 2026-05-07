## 2024-05-18 - Missing unprivileged configuration in LXC containers
**Vulnerability:** Proxmox LXC containers without `unprivileged = true` run as privileged containers, which maps the root user in the container to the root user on the Proxmox host. This presents a critical host compromise risk if a container is breached.
**Learning:** Found 5 Terraform LXC container definitions (`proxmox_virtual_environment_container`) lacking the `unprivileged = true` parameter.
**Prevention:** All LXC container modules must enforce `unprivileged = true` by default to ensure defense-in-depth and prevent unauthorized access to the host node.
