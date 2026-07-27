# homebrew-tap

Homebrew tap for CorvidLabs tools.

## Usage

```bash
brew tap corvidlabs/tap
brew install corvidlabs/tap/<formula>
```

## Formulae

| Formula | Description |
| --- | --- |
| `fledge` | Dev lifecycle CLI - one tool for the dev loop, any language |
| `spec-sync` | Bidirectional spec-to-code validation for CI-enforced contracts |
| `augur` | Graded trust for code changes with deterministic risk scoring |
| `attest` | Signed provenance ledger for code changes |
| `corvid-trust` | Unified lifecycle, contract, risk, and provenance gate (bundles fledge, spec-sync, augur, attest) |
| `rune` | Universal TTY ↔ AI Agent bridge and Ruby CLI framework |
| `threemd` | CLI for the 3md format: Markdown extended along one free Z axis |

Each formula pins an exact, checksum-verified release of its upstream repository.

## Releasing

Bump a formula's `url`, `version`, and `sha256` to match a new upstream tag, then open a PR against `main`. CI installs the formula on macOS and Ubuntu before merge is allowed.
