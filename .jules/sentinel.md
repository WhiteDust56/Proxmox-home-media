## 2025-02-20 - GitHub Actions Supply Chain Attack Vector
**Vulnerability:** Discovered a vulnerability pattern where GitHub Actions workflows in the `.github/workflows` directory were relying on mutable semantic version tags, exposing the CI pipeline to supply chain attacks.
**Learning:** Mutable tags in CI are uniquely risky here due to the sensitive nature of the infrastructure managed via Terragrunt; executing a compromised action with infrastructure credentials would be catastrophic.
**Prevention:** Implemented a mandatory reusable security pattern for this project where all GitHub Actions must strictly use immutable commit SHAs.
