## 2026-06-02 - Pinning GitHub Actions dependencies
**Vulnerability:** Mutable tags (e.g. @v4, @v3) in GitHub actions workflow can be hijacked to point to malicious code, exposing the CI pipeline to supply chain attacks.
**Learning:** GitHub Actions should use immutable commit SHAs rather than mutable tags.
**Prevention:** Explicitly specify the git commit SHA instead of using standard tags to guarantee that the code running in CI won't change unintentionally.
