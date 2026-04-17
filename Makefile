.PHONY: verify test

verify:
	./scripts/verify_cert.sh certs/AIV_CERT_CLAIM_0001.json

test:
	./scripts/verify_cert.sh certs/AIV_CERT_CLAIM_0001.json
