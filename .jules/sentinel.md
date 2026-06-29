## 2026-06-29 - Immutable GitHub Action SHAs
**Vulnerability:** Use of mutable version tags (e.g., `@v4`) in GitHub Actions workflows exposes the CI/CD pipeline to supply chain attacks if the tag is hijacked.
**Learning:** The project relies on external actions. Pinning to immutable commit SHAs is a reusable security pattern for this project to ensure dependencies cannot be silently altered.
**Prevention:** Always use specific commit SHAs for GitHub Actions instead of semantic version tags, and add comments indicating the tag for readability.
