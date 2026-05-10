## 2024-05-23 - GitHub Actions Supply Chain Risk
**Vulnerability:** GitHub Actions workflows were using mutable version tags (e.g., `@v4`) which can be updated to point to malicious commits, enabling supply chain attacks.
**Learning:** Always pin GitHub Actions to specific, immutable commit SHAs to ensure the executed code is exactly what was reviewed and approved.
**Prevention:** Use commit SHAs instead of version tags in the `uses` block of GitHub Actions workflows.
