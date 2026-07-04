## 2026-07-04 - Immutable GitHub Actions SHAs
**Vulnerability:** GitHub Actions in CI workflow use mutable version tags (e.g. `@v4`) which can be overridden, posing a supply chain risk.
**Learning:** An attacker compromising a GitHub Action repository could overwrite a version tag with malicious code, leading to compromised CI runners.
**Prevention:** Always pin GitHub Actions to their latest specific, immutable commit SHAs rather than mutable version tags.
