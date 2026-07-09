## 2026-07-09 - Pin GitHub Actions to Immutable SHAs
**Vulnerability:** GitHub Actions workflows were using mutable version tags (e.g., @v3 or @v4), which can be updated by repository owners to point to malicious code, introducing a supply chain attack vector.
**Learning:** Always use specific, immutable commit SHAs for third-party GitHub Actions to guarantee the exact code being executed, mitigating the risk of compromised actions.
**Prevention:** Enforce policies to pin all GitHub Actions to commit SHAs and regularly update them via automated tools like Dependabot.
