---
change: CHG-0003-align-the-corvid-trust-homebrew-formula-dependency-assertion-and-repository-trus
artifact: testing
---

# Testing

Local verification:

- `fledge run syntax`
- `fledge run style`
- `specsync check --strict`
- `fledge trust verify --range origin/main...HEAD` with SpecSync `5.1.1` first on `PATH`

Hosted verification:

- Formula installation matrix passes on macOS and Ubuntu, including `corvid-trust`.
- Trust runs with explicitly pinned SpecSync `5.1.1` and accepts the current lifecycle evidence.
- CodeQL continues to pass for Actions and Ruby.
