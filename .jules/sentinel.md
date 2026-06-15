## 2024-06-15 - Pin GitHub Actions to Immutable Commit SHAs
**Vulnerability:** GitHub Actions were using mutable version tags (e.g., `@v3`, `@v4`), which are susceptible to supply chain attacks if the tag is pointed to a malicious commit.
**Learning:** Using mutable tags can introduce severe security vulnerabilities in the CI/CD pipeline.
**Prevention:** Always pin GitHub Actions to specific, immutable commit SHAs rather than using version tags, to ensure that the code being executed does not unexpectedly change.