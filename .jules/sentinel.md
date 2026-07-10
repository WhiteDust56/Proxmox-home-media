## 2024-05-23 - Pin GitHub Actions to Immutable SHAs
**Vulnerability:** GitHub Actions workflows were using mutable version tags (e.g., @v3, @v4).
**Learning:** This exposes the pipeline to supply chain attacks, as attackers could potentially push malicious code to those version tags.
**Prevention:** Pin all GitHub Actions to specific, immutable commit SHAs, and include a comment with the corresponding version tag for readability.
