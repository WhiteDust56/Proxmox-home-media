## 2024-05-05 - Missing unprivileged flag in LXC container
**Vulnerability:** Found multiple `proxmox_virtual_environment_container` resources missing `unprivileged = true`. Without this, LXC containers run as privileged, giving root inside the container root access to the host node.
**Learning:** Security gaps can exist in otherwise functional IaaC. A failure to explicitly declare `unprivileged = true` defaults to potentially dangerous privileged containers.
**Prevention:** In Terraform configs managing Proxmox, always enforce `unprivileged = true` unless strictly necessary and documented.
