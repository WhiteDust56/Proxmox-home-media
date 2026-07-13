## 2024-05-15 - Pin GitHub Actions to Immutable SHAs
**Vulnerability:** GitHub Actions were referenced using mutable version tags (e.g., `@v4`). An attacker who gains control of the action's repository could modify the tag to point to a malicious commit, executing arbitrary code in the CI environment.
**Learning:** Using mutable tags for CI/CD actions introduces a supply chain vulnerability.
**Prevention:** Always pin GitHub Actions to their specific, immutable commit SHAs, and add a comment indicating the version it corresponds to for maintainability.
