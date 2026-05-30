## 2026-05-30 - Pin GitHub Actions to Immutable SHAs
**Vulnerability:** GitHub Actions using mutable version tags (e.g., `@v4`) are susceptible to supply chain attacks if the tag is overwritten by a compromised maintainer or malicious actor.
**Learning:** Pinning GitHub Actions to specific, immutable commit SHAs mitigates the risk of sudden malicious changes executing within the CI environment.
**Prevention:** Always use `git ls-remote` to determine and explicitly pin the precise commit SHA for GitHub Actions dependencies within workflows instead of relying on mutable tags.
