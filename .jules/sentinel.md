## 2024-07-02 - Pin GitHub Actions to Immutable SHAs
**Vulnerability:** GitHub Action workflows using mutable version tags (e.g., @v3, @v4) are vulnerable to supply chain attacks if the tag is pointed to a malicious commit.
**Learning:** Relying on mutable tags for CI/CD pipelines introduces non-deterministic behavior and security risks, allowing potential arbitrary code execution within the CI environment.
**Prevention:** Always pin GitHub Actions to immutable, specific commit SHAs corresponding to the latest minor/patch versions to ensure integrity and predictability.
