#!/usr/bin/env bash
set -euo pipefail

CERT="${1:?usage: scripts/enforce_claim_0002.sh cert.json}"

python3 - "$CERT" <<'PY'
import json, os, subprocess, sys, tempfile, hashlib

cert_path = sys.argv[1]
obj = json.load(open(cert_path))
c2 = obj.get("claim_0002")
if not c2:
    print("SKIP: no claim_0002")
    sys.exit(0)

cmd = c2["command"]
env = c2.get("env", {})
artifact = c2["artifact"]
expected = c2.get("expected_artifact_sha256")

def run_once():
    with tempfile.TemporaryDirectory(prefix="aiv_claim2_") as d:
        e = os.environ.copy()
        e.update(env)
        e.setdefault("LC_ALL","C")
        e.setdefault("LANG","C")
        # harden a bit
        e["HOME"] = d
        # run in temp dir, no shell profile
        subprocess.run(["bash","--noprofile","--norc","-lc", cmd], cwd=d, env=e, check=True)

        ap = os.path.join(d, artifact)
        if not os.path.isfile(ap):
            raise SystemExit(f"FAIL: artifact not produced: {artifact}")

        h = hashlib.sha256(open(ap,"rb").read()).hexdigest()
        return h

h1 = run_once()
h2 = run_once()

if h1 != h2:
    raise SystemExit(f"FAIL: nondeterministic artifact hash: {h1} != {h2}")

if expected and h1 != expected:
    raise SystemExit(f"FAIL: artifact hash mismatch vs expected: {h1} != {expected}")

print(f"PASS: claim_0002 deterministic (sha256={h1})")
PY
