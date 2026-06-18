## 2024-06-18 - GitHub Actions Supply Chain Risk
**Vulnerability:** GitHub Actions workflow tags (`@v3`, `@v4`) were used instead of immutable commit SHAs, exposing the CI pipeline to supply chain attacks if the tags were overwritten or compromised.
**Learning:** Even widely used, trusted actions can have their mutable tags updated to malicious versions, and CI systems will automatically pull the new code.
**Prevention:** Always pin GitHub Actions to specific, immutable commit SHAs, accompanied by version comments for readability (e.g., `@<sha> # v4.3.1`).
