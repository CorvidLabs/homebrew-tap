---
change: CHG-0002-publish-specsync-5-1-1-in-the-corvidlabs-homebrew-tap-using-the-verified-github
artifact: tasks
---

# Tasks

- [x] Replace the stale formula version and four platform digests.
- [x] Update the formula's installed-version assertion.
- [x] Validate formula syntax and Homebrew style.
- [x] Confirm all four formula digests match the uploaded GitHub Release archives.
- [x] Verify the current-platform archive checksum, layout, and `specsync 5.1.1` version output.
- [x] Prepare the exact lifecycle evidence and hosted macOS/Linux install matrix for the reviewed PR.
- [x] Align the `corvid-trust` formula dependency assertion with SpecSync `5.1.1`.
- [x] Pin the Trust workflow's lifecycle validation to SpecSync `5.1.1`.
- [ ] Re-run local and hosted formula, lifecycle, and Trust verification after the CI corrections.
