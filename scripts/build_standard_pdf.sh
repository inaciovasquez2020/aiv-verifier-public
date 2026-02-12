#!/usr/bin/env bash
set -euo pipefail

mkdir -p dist

{
  echo "AIV Admissibility Standard (v1.0)"
  echo
  cat standard/AIV_ADMISSIBILITY_STANDARD_v1.md
} | /usr/bin/env sed 's/\t/  /g' \
  | /usr/bin/env enscript -B -o - \
  | /usr/bin/env ps2pdf - dist/AIV_Admissibility_Standard_v1.pdf
