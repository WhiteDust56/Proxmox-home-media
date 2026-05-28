## 2024-05-28 - Pin GitHub Actions to Immutable SHAs
**Vulnerability:** The CI/CD pipeline used mutable version tags (e.g., `@v3`, `@v4`) for GitHub Actions, making the repository susceptible to supply chain attacks if those tags were maliciously reassigned or if a bad release was pushed.
**Learning:** Using mutable tags can lead to unexpected pipeline failures or security breaches. The exact commit SHA is immutable and guarantees the execution of verified code.
**Prevention:** Pin all GitHub Actions to specific, immutable commit SHAs instead of version tags. Use `git ls-remote` to fetch the correct commit SHA for the desired release.
