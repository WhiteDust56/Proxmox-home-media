## 2024-07-12 - Pin GitHub Actions to Immutable SHAs
**Vulnerability:** GitHub Actions were referencing mutable version tags (e.g., `@v4`).
**Learning:** This exposes the CI pipeline to supply chain attacks, as an attacker could compromise the action repository, update the tag to point to malicious code, and automatically inject it into our builds.
**Prevention:** Always pin GitHub Actions to specific, immutable commit SHAs rather than using mutable tags.
