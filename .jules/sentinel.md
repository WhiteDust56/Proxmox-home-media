## 2024-05-15 - [CRITICAL] Supply Chain Vulnerability via Mutable Action Tags
**Vulnerability:** The GitHub Actions workflow (`.github/workflows/terraform.yml`) used mutable version tags (e.g., `@v4`, `@v3`) for actions.
**Learning:** Mutable tags can be moved by the action maintainer to a different commit. If the action repository is compromised, an attacker can move the tag to a malicious commit, executing arbitrary code within our CI environment and potentially exfiltrating secrets or altering infrastructure.
**Prevention:** Always pin GitHub Actions to specific, immutable commit SHAs, accompanied by the version tag as a comment for readability. Ensure the SHA corresponds to the latest minor/patch version to prevent CI failures from deprecated actions.
