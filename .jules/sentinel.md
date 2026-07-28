## 2024-07-28 - Enforce TLS certificate verification for Proxmox provider
**Vulnerability:** The Proxmox provider was configured with `insecure = true`, which disables TLS certificate verification. This exposes the API communication to Man-in-the-Middle (MitM) attacks.
**Learning:** Defaulting to insecure communication for convenience bypasses fundamental security controls and leaves infrastructure endpoints vulnerable to interception.
**Prevention:** Always enforce TLS certificate verification (`insecure = false`) for provider endpoints unless absolutely necessary in a controlled, isolated environment with documented justification.
