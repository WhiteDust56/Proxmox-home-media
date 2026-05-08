## 2024-05-08 - Pinned GitHub Actions to SHAs
**Vulnerability:** Found mutable tags (like `@v3` and `@v4`) being used for GitHub Actions in the CI pipeline (`.github/workflows/terraform.yml`). Mutable tags can be silently updated by the action author to include malicious code, creating a supply chain vulnerability.
**Learning:** Depending on mutable tags for CI/CD pipeline dependencies is a security risk. A compromised third-party action could access repository secrets, alter code, or push malicious artifacts.
**Prevention:** Always pin GitHub Actions to specific commit SHAs. This ensures that the exact code reviewed and tested is the code executed, preventing arbitrary supply chain attacks.
