## 2026-06-20 - Pin GitHub Actions to Immutable Commit SHAs
**Vulnerability:** GitHub Actions workflows often use mutable version tags (e.g., `@v3` or `@v4`), which can be changed without warning or compromised via a supply chain attack.
**Learning:** It is a critical security best practice to pin GitHub Actions to specific, immutable commit SHAs rather than using mutable version tags to mitigate the risk of supply chain attacks. When pinning to commit SHAs, ensure you use the SHA corresponding to the latest minor/patch version to prevent CI failures.
**Prevention:** Always use the immutable commit SHA of the exact version needed when specifying GitHub Actions in workflows.
