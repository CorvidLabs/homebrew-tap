---
change: CHG-0002-publish-specsync-5-1-1-in-the-corvidlabs-homebrew-tap-using-the-verified-github
artifact: plan
---

# Plan

1. Read the `v5.1.1` archive digests from the completed GitHub Release.
2. Update `Formula/spec-sync.rb` to version `5.1.1`, the four exact digests, and the version test.
3. Run repository syntax/style validation and exercise the formula installation path.
4. Publish the reviewed tap update and verify the remote formula advertises `5.1.1`.
