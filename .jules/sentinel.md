## 2026-06-27 - Supply Chain Attack Vector in GitHub Actions
**Vulnerability:** GitHub Actions workflows in `.github/workflows/terraform.yml` were using mutable version tags (e.g., `@v3`, `@v4`) instead of immutable commit SHAs.
**Learning:** Using mutable tags allows a malicious actor who compromises a third-party action repository to push compromised code to an existing tag, automatically infecting downstream CI/CD pipelines.
**Prevention:** Always pin GitHub Actions to specific, immutable commit SHAs rather than using mutable version tags to mitigate the risk of supply chain attacks.
