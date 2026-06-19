## 2024-06-19 - Pin GitHub Actions to Immutable SHAs
**Vulnerability:** GitHub Actions using mutable version tags (e.g., `@v4`, `@v3`) are susceptible to supply chain attacks if the tag is pointed to a malicious commit.
**Learning:** Pinning actions to specific, immutable commit SHAs ensures that the exact code executed is predictable and cannot be altered by modifying a tag, enhancing the security of the CI pipeline.
**Prevention:** Always use immutable commit SHAs for GitHub Actions instead of mutable version tags.
