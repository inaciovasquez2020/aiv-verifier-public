#!/usr/bin/env bash
set -euo pipefail

CERT="$1"
SIG="${CERT}.minisig"

minisign -Vm "$CERT" -x "$SIG" -p scripts/keys/active.pub
