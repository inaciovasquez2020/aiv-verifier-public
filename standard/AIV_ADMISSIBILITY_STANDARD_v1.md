AIV Admissibility Standard (v1.0)

1. Scope
An artifact/certificate set is admissible iff its AIV certificates verify.

2. Required files per certificate
- certs/AIV_CERT_*.json
- certs/AIV_CERT_*.hash  (sha256 of the JSON file)
- certs/AIV_CERT_*.hash.minisig (minisign signature over the hash file)

3. Trust anchor
- keys/aiv_pub.key

4. Verification procedure
For each certificate JSON:
(a) compute sha256(JSON) and compare to certs/*.hash
(b) verify certs/*.hash.minisig against keys/aiv_pub.key

Reference command:
  ./scripts/verify_cert.sh certs/AIV_CERT_<ID>.json

5. Enforcement
Repositories claiming AIV admissibility MUST run verification in CI on push and PR.
