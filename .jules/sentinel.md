## 2024-05-28 - Pin GitHub Actions to Immutable SHAs
**Vulnerability:** GitHub Actions using mutable version tags (e.g., `@v3` or `@v4`) are susceptible to supply chain attacks if the tag is pointed to a compromised commit.
**Learning:** Pinning GitHub Actions to specific, immutable commit SHAs mitigates this risk by ensuring only the verified code executes.
**Prevention:** Always use the full commit SHA corresponding to the latest minor/patch version when referencing GitHub Actions, and optionally append the version as a comment for readability.