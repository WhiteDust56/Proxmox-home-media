## 2024-05-23 - Pin GitHub Actions to Immutable SHAs
**Vulnerability:** The GitHub Actions workflow used mutable version tags (e.g., `@v3`, `@v4`) which are susceptible to supply chain attacks if a version tag is maliciously moved.
**Learning:** In highly privileged environments like infrastructure-as-code deployments, compromised CI/CD dependencies can lead to full infrastructure takeover.
**Prevention:** Always pin GitHub Actions to specific, immutable commit SHAs and include the version as a comment for maintainability.
