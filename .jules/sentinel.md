## 2026-06-26 - Pinning GitHub Actions to Immutable SHAs
**Vulnerability:** GitHub Actions configured with mutable tags (e.g., `@v4`) are susceptible to supply chain attacks if the tag is pointed to a malicious commit.
**Learning:** Always use immutable commit SHAs for third-party actions to guarantee the exact code being executed has not been tampered with.
**Prevention:** Verify and pin the full 40-character SHA of the specific version required, and add the version as a comment for readability (e.g., `@<sha> # v4.3.1`).
