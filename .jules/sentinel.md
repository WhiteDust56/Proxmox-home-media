## 2024-06-11 - Pinning GitHub Actions to SHAs
**Vulnerability:** GitHub Action steps were using mutable version tags (e.g., `@v3`, `@v4`), which can be modified by the author or a malicious actor to point to compromised code, introducing a supply chain attack risk.
**Learning:** Using mutable tags for CI/CD actions introduces severe supply chain vulnerabilities. Always rely on immutable commit SHAs.
**Prevention:** Ensure all GitHub Actions are pinned to specific, immutable commit SHAs, matching the latest minor/patch versions to avoid CI failures from deprecated actions.
