## 2026-06-21 - Pinning GitHub Actions for Supply Chain Security
**Vulnerability:** The GitHub Actions in `.github/workflows/terraform.yml` were using mutable version tags (e.g., `@v3` and `@v4`), which can be altered maliciously to execute a supply chain attack.
**Learning:** Using immutable commit SHAs for actions guarantees the executed action version cannot be surreptitiously updated, avoiding malicious code execution.
**Prevention:** Always pin GitHub Actions to immutable commit SHAs (verified with `git ls-remote`) in all CI/CD pipelines instead of version tags.
