## 2026-07-03 - Supply Chain Vulnerability
**Vulnerability:** GitHub Actions used mutable version tags (`@v3`, `@v4`), exposing the CI pipeline to supply chain attacks if the tags are malicious or compromised.
**Learning:** Hardcoded, mutable tags bypass version control immutability and create a hidden external dependency vector.
**Prevention:** Always pin GitHub Actions to their specific, immutable commit SHAs for the targeted minor/patch release version.
