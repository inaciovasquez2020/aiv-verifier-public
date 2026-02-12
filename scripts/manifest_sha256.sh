#!/usr/bin/env bash
set -euo pipefail

DIR="${1:?usage: scripts/manifest_sha256.sh dir}"
cd "$DIR"

# stable file list, stable hashing, stable concatenation
find . -type f -print0 \
| LC_ALL=C sort -z \
| xargs -0 shasum -a 256 \
| awk '{print $1"  "$2}' \
| shasum -a 256 \
| awk '{print $1}'
