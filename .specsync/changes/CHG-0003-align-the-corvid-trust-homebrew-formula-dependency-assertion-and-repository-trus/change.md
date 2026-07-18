---
id: CHG-0003-align-the-corvid-trust-homebrew-formula-dependency-assertion-and-repository-trus
state: approved
type: feature
base_commit: 90f8b9f5a293e28e0b02cf996f54455ec58039a1
---

# Align the Corvid Trust Homebrew formula dependency assertion and repository Trust workflow with SpecSync 5.1.1 so PR #14 formula and lifecycle CI pass

## Intent

Align the Corvid Trust Homebrew formula dependency assertion and repository Trust workflow with SpecSync 5.1.1 so PR #14 formula and lifecycle CI pass

## Affected Canonical Specs

- None

## Acceptance Criteria

- Formula/corvid-trust.rb validates specsync --version as 5.1.1; .github/workflows/trust.yml explicitly supplies specsync-version 5.1.1 to the pinned Trust action; hosted macOS, Ubuntu, and Trust checks pass.

## No-spec Rationale

The tap has no canonical module specs; this follow-up only aligns formula dependency validation and the repository Trust workflow with the already published SpecSync release.
