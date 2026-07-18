---
change: CHG-0002-publish-specsync-5-1-1-in-the-corvidlabs-homebrew-tap-using-the-verified-github
artifact: context
---

# Context

The GitHub Release `v5.1.1` is published from the fully verified SpecSync main commit. The tap's
`Formula/spec-sync.rb` still advertises `5.0.1`, so `brew install corvidlabs/tap/spec-sync` does not
deliver the current release.

The release contains archive/checksum pairs for macOS arm64, macOS x86_64, Linux arm64, and Linux
x86_64. GitHub's uploaded-asset SHA-256 digests are the canonical inputs for this formula update.
No SpecSync source behavior or public API is modified in this repository.

PR #14's hosted matrix exposed two release-parity inputs that must move with the formula: the
`corvid-trust` formula's dependency-version assertion and the Trust workflow's SpecSync version.
Both must use `5.1.1` so formula and lifecycle CI validate the release actually being published.
