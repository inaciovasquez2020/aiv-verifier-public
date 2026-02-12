#!/usr/bin/env bash
set -euo pipefail

CERT_JSON="$1"
COMMENT="${2:-aiv-cert-v1}"

HASH_FILE="${CERT_JSON%.json}.hash"

shasum -a 256 "$CERT_JSON" | awk '{print $1}' > "$HASH_FILE"

LC_ALL=C minisign -S \
  -m "$HASH_FILE" \
  -s keys/aiv_sec.key \
  -c "$COMMENT"

echo "Issued:"
echo "  $CERT_JSON"
echo "  $HASH_FILE"
echo "  $HASH_FILE.minisig"
