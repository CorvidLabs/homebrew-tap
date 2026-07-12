#!/usr/bin/env bash
set -euo pipefail

for formula in Formula/*.rb; do
    ruby -c "$formula"
done
