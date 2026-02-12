#!/usr/bin/env bash
set -euo pipefail

CERT="$1"
SIG="${CERT%.json}.hash.minisig"
PUB="scripts/keys/active.pub"

minisign -V -p "$PUB" -m "$CERT" -x "$SIG"
