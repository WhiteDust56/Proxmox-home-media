## 2026-06-25 - Pin GitHub Actions to Immutable SHAs
**Vulnerability:** GitHub Actions in CI were using mutable version tags (`@v3`, `@v4`), leaving the pipeline vulnerable to supply chain attacks if the tags are updated to malicious commits or compromised.
**Learning:** This repo's CI relies on external actions that must be pinned to immutable commit SHAs to ensure a deterministic and secure pipeline.
**Prevention:** Always use immutable commit SHAs (e.g., `actions/checkout@34e114876b0b11c390a56381ad16ebd13914f8d5`) for third-party GitHub Actions instead of mutable version tags.
