---
change: CHG-0002-publish-specsync-5-1-1-in-the-corvidlabs-homebrew-tap-using-the-verified-github
artifact: docs
---

# Docs

The formula is the user-facing installation metadata for the Homebrew channel. Updating its version,
download URLs, checksums, and test assertion is the complete documentation impact. No separate tap
README or SpecSync product documentation change is required.

The dependent `corvid-trust` formula test and repository Trust workflow are release validation
metadata rather than product documentation; their pinned SpecSync version must match the formula.
