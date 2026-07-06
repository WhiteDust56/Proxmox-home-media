## 2024-07-06 - Supply Chain Security via GitHub Actions Pinning
**Vulnerability:** Mutable tags (e.g., `@v3`, `@v4`) in GitHub Actions workflows expose the pipeline to supply chain attacks if the action repository is compromised and the mutable tag is overwritten with a malicious commit.
**Learning:** Pinning GitHub Actions to immutable commit SHAs mitigates this risk by ensuring the pipeline only executes the exact code reviewed and verified at that specific commit.
**Prevention:** Always use immutable commit SHAs combined with descriptive comments (e.g., `# v4.3.1`) for all third-party GitHub Actions, and avoid using mutable version tags.
