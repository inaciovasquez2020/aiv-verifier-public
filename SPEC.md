# AIV Verifier Specification

## Acceptance Condition

A claim is accepted iff:
- witness is valid
- invariants hold
- capacity constraints are satisfied
- verification is reproducible

## Failure Modes

- invalid witness
- invariant violation
- capacity overflow
- non-deterministic outcome

## Requirement

All accepted outputs must be reproducible under identical input.
