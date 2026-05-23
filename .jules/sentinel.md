## 2026-05-23 - GitHub Actions Mutable Tag Vulnerability
**Vulnerability:** The project's GitHub Actions workflow (`.github/workflows/terraform.yml`) used mutable version tags (e.g., `@v3`, `@v4`) for its actions, exposing the CI pipeline to supply chain attacks if the tags were hijacked or updated maliciously by their maintainers.
**Learning:** Using mutable tags is insecure because an attacker can overwrite a tag with a malicious commit, causing the workflow to unknowingly execute compromised code.
**Prevention:** Pin all GitHub Actions to specific, immutable commit SHAs, which cryptographically guarantee the exact version of the code executed, and append comments for clarity.
