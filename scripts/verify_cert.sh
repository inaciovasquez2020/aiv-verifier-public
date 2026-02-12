#!/usr/bin/env bash
set -euo pipefail

CERT="${1:?usage: scripts/verify_cert.sh cert.json}"
HASH="${CERT%.json}.hash"
SIG="${HASH}.sig"
PUB="keys/aiv_pub.key"

[[ -f "$CERT" ]] || { echo "FAIL: cert missing"; exit 1; }
[[ -f "$HASH" ]] || { echo "FAIL: hash missing"; exit 1; }
[[ -f "$SIG"  ]] || { echo "FAIL: signature missing"; exit 1; }
[[ -f "$PUB"  ]] || { echo "FAIL: public key missing"; exit 1; }

REHASH="$(shasum -a 256 "$CERT" | awk '{print $1}')"
STORED="$(cat "$HASH")"

[[ "$REHASH" == "$STORED" ]] || { echo "FAIL: certificate modified"; exit 2; }

minisign -Vm "$HASH" -x "$SIG" -p "$PUB" >/dev/null

echo "PASS: AIV certificate verified (minisign)"
