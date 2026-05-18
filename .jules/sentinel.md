## 2026-05-18 - Supply Chain Attack Mitigation for GitHub Actions
**Vulnerability:** The CI pipeline used mutable version tags (`@v3`, `@v4`) for GitHub Actions, exposing the pipeline to supply chain attacks if a tag is hijacked or modified by a malicious actor.
**Learning:** Pinning actions to immutable commit SHAs guarantees the integrity of the CI pipeline by ensuring only the specific, verified version of an action is executed.
**Prevention:** Always use `git ls-remote` to fetch and pin the exact commit SHA for third-party GitHub Actions in workflow files instead of using mutable version tags.
