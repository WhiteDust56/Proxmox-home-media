## 2024-05-24 - Pin GitHub Actions to Immutable SHAs
**Vulnerability:** GitHub Actions using mutable version tags (e.g., @v3, @v4) are vulnerable to supply chain attacks if a malicious actor takes over the repository and pushes a compromised commit to those tags.
**Learning:** Using mutable tags is a known security anti-pattern in CI/CD environments.
**Prevention:** Always pin GitHub Actions to specific, immutable commit SHAs.
