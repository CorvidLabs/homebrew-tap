---
change: CHG-0003-align-the-corvid-trust-homebrew-formula-dependency-assertion-and-repository-trus
artifact: plan
---

# Plan

1. Update the `corvid-trust` formula test to expect SpecSync `5.1.1`.
2. Pass `specsync-version: "5.1.1"` to the pinned Trust action.
3. Run formula syntax, Homebrew style, SpecSync strict, and Trust verification locally.
4. Push the correction and require the hosted macOS, Ubuntu, Trust, and CodeQL checks to pass.
