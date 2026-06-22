## 2024-06-23 - Pin GitHub Actions to Immutable SHAs
**Vulnerability:** GitHub Actions using mutable version tags (e.g., @v3 or @v4) are vulnerable to supply chain attacks, as the underlying tags can be moved by the action owner to point to malicious code.
**Learning:** This codebase's CI pipeline used mutable version tags for critical actions (checkout, setup-terraform, action-terragrunt, cache), exposing the infrastructure deployment process to potential compromise.
**Prevention:** Pin all third-party GitHub Actions to specific, immutable commit SHAs corresponding to the latest safe release version, and use comments to indicate the version tag for readability.
