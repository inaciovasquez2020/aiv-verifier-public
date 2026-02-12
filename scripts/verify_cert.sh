#!/usr/bin/env bash
set -euo pipefail

CERT="${1:?usage: verify_cert.sh cert.json}"

HASH_FILE="${CERT%.json}.hash"
SIG_FILE="${HASH_FILE}.minisig"
PUB=certs/aiv_pub.key

[[ -f "$CERT" ]]      || { echo "FAIL: cert missing"; exit 1; }
[[ -f "$HASH_FILE" ]] || { echo "FAIL: hash missing"; exit 1; }
[[ -f "$SIG_FILE" ]]  || { echo "FAIL: minisign signature missing"; exit 1; }
[[ -f "$PUB" ]]       || { echo "FAIL: public key missing"; exit 1; }

REHASH="$(shasum -a 256 "$CERT" | awk '{print $1}')"
STORED="$(cat "$HASH_FILE")"

[[ "$REHASH" == "$STORED" ]] || { echo "FAIL: certificate modified"; exit 2; }

minisign -Vm "$HASH_FILE" -p "$PUB" >/dev/null

echo "PASS: AIV certificate verified (minisign)"
