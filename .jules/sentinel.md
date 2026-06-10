## 2024-06-09 - Pin GitHub Actions to Immutable SHAs
**Vulnerability:** GitHub Actions using mutable tags (e.g., `@v4`) are susceptible to supply chain attacks if the tag is pointed to a malicious commit.
**Learning:** Using mutable tags can lead to executing untrusted code in CI/CD pipelines.
**Prevention:** Always pin GitHub Actions to specific, immutable commit SHAs rather than using mutable version tags.
