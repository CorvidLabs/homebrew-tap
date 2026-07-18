---
change: CHG-0002-publish-specsync-5-1-1-in-the-corvidlabs-homebrew-tap-using-the-verified-github
artifact: testing
---

# Testing

Automated verification:

- `bash scripts/validate-formulae.sh`
- `brew style Formula/spec-sync.rb`
- `brew style Formula/corvid-trust.rb`
- `specsync change verify CHG-0002-...`
- `fledge trust verify`

Hosted verification:

- Formula install matrix passes on macOS and Ubuntu with the dependent `corvid-trust` test.
- Trust runs with explicitly pinned SpecSync `5.1.1` and accepts the current lifecycle evidence.

Release verification:

- Confirm all four formula SHA-256 values match GitHub's uploaded-asset digests.
- Install or test the formula against the `v5.1.1` release archive on the current platform.
- Confirm the installed executable reports `specsync 5.1.1`.
