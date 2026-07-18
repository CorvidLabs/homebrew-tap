---
change: CHG-0003-align-the-corvid-trust-homebrew-formula-dependency-assertion-and-repository-trus
artifact: context
---

# Context

PR #14 installs the updated SpecSync `5.1.1` formula successfully, but the dependent
`Formula/corvid-trust.rb` test still expects SpecSync `5.0.1`. The repository Trust workflow also
uses the pinned Trust action's default SpecSync `5.0.1`, which cannot validate lifecycle evidence
produced by SpecSync `5.1.1`.

Both pins must move together with the published formula so hosted validation exercises the same
release that Homebrew users receive. This changes no executable source or public API.

Trust v1.0.1 is the first released immutable action revision that accepts `specsync-version`. Its
supply-chain policy requires non-default SpecSync versions to be staged in a checksum-validated,
runner-local mirror, so the workflow downloads the official Linux archive and `.sha256` sidecar,
verifies them, and passes the authority-free local `file://` URL to Trust. PR #14's macOS, Ubuntu,
Trust, and CodeQL checks all pass with that configuration.
