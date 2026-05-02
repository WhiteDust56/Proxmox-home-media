## 2024-05-24 - Proxmox LXC Container Unprivileged Configuration
**Vulnerability:** Proxmox LXC containers (`proxmox_virtual_environment_container`) were missing `unprivileged = true`. This could potentially allow host compromise by not mapping the root user to an unprivileged user on the host.
**Learning:** In infrastructure as code (IaC), it's easy to miss container specific security settings. Some modules had it while others did not, demonstrating inconsistency.
**Prevention:** Always verify `unprivileged = true` is set for `proxmox_virtual_environment_container` resources. We could use tools like Checkov, tfsec, or tflint to automate this.
