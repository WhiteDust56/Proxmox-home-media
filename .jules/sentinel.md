## 2024-05-18 - Pin GitHub Actions
**Vulnerability:** GitHub Actions using mutable version tags (e.g., `@v3` or `@v4`) are susceptible to supply chain attacks if the tag is pointed to a malicious commit.
**Learning:** In GitHub Actions workflows, actions should be pinned to specific, immutable commit SHAs corresponding to the latest minor/patch versions to mitigate this risk.
**Prevention:** Always use full 40-character commit SHAs (e.g., `@34e114876b0b11c390a56381ad16ebd13914f8d5` for checkout) instead of tags.
