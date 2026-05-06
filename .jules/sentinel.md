## 2026-05-06 - Unprivileged LXC Containers
**Vulnerability:** LXC containers created via the `proxmox_virtual_environment_container` resource without setting `unprivileged = true` run in privileged mode by default. This maps the container's root user directly to the host's root user, allowing an attacker who compromises the container to escape to the host node.
**Learning:** All LXC configurations must be explicitly checked and configured as `unprivileged = true` to ensure they use user namespaces to map root internally to an unprivileged user on the host.
**Prevention:** Establish CI/CD linting checks to explicitly fail deployments of LXC containers lacking `unprivileged = true` when running within Terraform/Terragrunt.
