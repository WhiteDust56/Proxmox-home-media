## 2026-07-27 - Enforce strict TLS certificate validation
**Vulnerability:** The Proxmox provider in terragrunt.hcl had insecure = true set, disabling TLS certificate verification.
**Learning:** The configuration was likely set during initial development to bypass self-signed certificate errors, but it was left in place, leaving API communication between Terraform and the Proxmox cluster vulnerable to Man-in-the-Middle (MitM) attacks.
**Prevention:** Always enforce TLS certificate verification by setting insecure = false in provider configurations unless operating in an explicitly untrusted environment with a documented exception.
