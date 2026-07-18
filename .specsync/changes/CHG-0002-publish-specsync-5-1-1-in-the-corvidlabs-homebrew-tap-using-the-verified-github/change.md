---
id: CHG-0002-publish-specsync-5-1-1-in-the-corvidlabs-homebrew-tap-using-the-verified-github
state: verifying
type: feature
base_commit: 6c39150dbb5eae3c4e09bb04b6d6b0f5493ce96f
---

# Publish SpecSync 5.1.1 in the CorvidLabs Homebrew tap using the verified GitHub Release artifact checksums and validate the formula

## Intent

Publish SpecSync 5.1.1 in the CorvidLabs Homebrew tap using the verified GitHub Release artifact checksums and validate the formula

## Affected Canonical Specs

- None

## Acceptance Criteria

- Formula/spec-sync.rb declares version 5.1.1; all four macOS/Linux URLs resolve to the v5.1.1 GitHub Release; every SHA-256 matches its uploaded archive; formula syntax and Homebrew style pass; and an installed formula binary reports specsync 5.1.1.
- Formula/corvid-trust.rb validates its SpecSync dependency at version 5.1.1, and the Trust workflow explicitly verifies lifecycle evidence with SpecSync 5.1.1.

## No-spec Rationale

This tap has no canonical module specs; the change updates release-only Homebrew distribution metadata and does not alter SpecSync source behavior.
