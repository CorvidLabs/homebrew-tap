---
change: CHG-0002-publish-specsync-5-1-1-in-the-corvidlabs-homebrew-tap-using-the-verified-github
artifact: requirements
---

# Requirements

## REQ-homebrew-001 — Current release

The SpecSync Homebrew formula SHALL declare version `5.1.1` and resolve every supported platform
URL from the GitHub Release tag `v5.1.1`.

Acceptance criteria:

- macOS arm64 and x86_64 resolve their matching `v5.1.1` archives.
- Linux arm64 and x86_64 resolve their matching `v5.1.1` archives.

## REQ-homebrew-002 — Artifact integrity

The formula SHALL pin each supported archive to the SHA-256 digest published for that exact
GitHub Release asset.

Acceptance criteria:

- All four formula digests equal the corresponding uploaded-asset digests.
- Homebrew accepts every downloaded archive without a checksum mismatch.

## REQ-homebrew-003 — Installed version

The installed formula binary SHALL report `specsync 5.1.1` from `specsync --version`.

Acceptance criteria:

- The formula test asserts the `5.1.1` version.
- Formula syntax, repository validation, and Homebrew style checks pass.
