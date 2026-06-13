## 2024-06-13 - Supply Chain Vulnerability in CI

**Vulnerability:** GitHub Actions in `.github/workflows/terraform.yml` were pinned using mutable tags (e.g., `@v4`). This exposes the pipeline to supply chain attacks if a tag is forcefully updated to point to a malicious commit.
**Learning:** Using mutable tags for GitHub Actions is a security risk. Actions should be pinned to immutable commit SHAs to guarantee the exact code being executed.
**Prevention:** Pin all GitHub Actions to their specific, immutable commit SHAs. Use comments to indicate the version tag for readability (e.g., `uses: actions/checkout@<sha> # v4.3.1`).
