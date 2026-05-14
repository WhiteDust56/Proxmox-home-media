## 2024-05-14 - Mutable GitHub Actions Tags
**Vulnerability:** GitHub Actions workflow was using mutable version tags (e.g., `@v4`, `@v3`) which are susceptible to supply chain attacks if the repository owner's account or tags are compromised.
**Learning:** Hardcoded, explicit, and immutable commit SHAs provide better safety over floating tags because they uniquely identify the exact code to execute, preventing silent updates to compromised action versions.
**Prevention:** Always pin GitHub Action steps using exact commit SHAs (obtained via `git ls-remote`) instead of using floating tags.
