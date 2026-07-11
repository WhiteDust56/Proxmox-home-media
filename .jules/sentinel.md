## 2026-07-11 - Pin GitHub Actions to Immutable SHAs
**Vulnerability:** GitHub Actions are using mutable version tags (e.g. `@v4`). An attacker who compromises a GitHub Action's repository can overwrite the tag with malicious code, leading to a supply-chain attack.
**Learning:** By pinning actions to specific immutable commit SHAs, the workflow guarantees that the exact known, safe version of the action is executed.
**Prevention:** Always use the full commit SHA instead of version tags for third-party actions in GitHub CI workflows.
