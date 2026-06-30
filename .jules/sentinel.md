## 2024-07-01 - Pin GitHub Actions to Immutable SHAs
**Vulnerability:** Using mutable version tags (e.g., @v3 or @v4) for GitHub Actions allows a compromised action repository to push malicious code to an existing tag, leading to a supply chain attack in CI pipelines.
**Learning:** Pinning actions to specific, immutable commit SHAs guarantees that the exact tested code is executed every time, preventing unexpected or malicious changes from executing in the pipeline.
**Prevention:** Always use `git ls-remote --tags <url>` to find the specific commit SHA corresponding to the latest minor/patch version and use it in workflow files, appending the version tag as a comment (e.g., `uses: actions/checkout@<sha> # v4.3.1`).
