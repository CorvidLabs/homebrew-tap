---
change: CHG-0003-align-the-corvid-trust-homebrew-formula-dependency-assertion-and-repository-trus
artifact: requirements
---

# Requirements

## REQ-homebrew-004 — Release validation parity

The Homebrew tap SHALL validate its SpecSync dependency and lifecycle evidence using version
`5.1.1`.

Acceptance criteria:

- `Formula/corvid-trust.rb` expects `specsync --version` to report `5.1.1`.
- `.github/workflows/trust.yml` explicitly supplies `specsync-version: "5.1.1"` to the pinned Trust action.
- Hosted formula installation passes on macOS and Ubuntu.
- Hosted Trust and CodeQL checks pass.
