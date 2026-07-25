## 2026-07-25 - Prevent Container Breakout Risk by Enforcing Unprivileged LXC

**Vulnerability:** Five LXC containers (lxc_118, lxc_104, lxc_117, lxc_109, lxc_112) in the Proxmox environment were missing the `unprivileged = true` setting, causing them to run as privileged containers by default.
**Learning:** Proxmox creates LXC containers as privileged by default unless explicitly configured otherwise. Privileged containers map root inside the container to root on the host, creating a critical container breakout risk if the container is compromised.
**Prevention:** Always explicitly define `unprivileged = true` in the `proxmox_virtual_environment_container` Terraform resource for all new containers to adhere to the principle of least privilege.
