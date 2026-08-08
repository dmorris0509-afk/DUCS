# DUCS — Deterministic Underlying Claim System

> **Evidence before automation.**

DUCS is an evidence-governed reference architecture and deterministic execution system designed to make evidence, authority, provenance, and decision boundaries inspectable and reproducible.

## Current Status

| Component | Status |
|---|---|
| DUCS-v0.1-FC | Frozen Candidate |
| RECON-001 | Frozen |
| DUCS-FIC-001 | PASS |
| DUCS-REF-001 v0.1 | Implementation Candidate |
| GOLD-001 | BLOCKED |
| DUCS-007A | Preflight INDETERMINATE |
| DUCS-007B–007D | BLOCKED |
| Certification | NOT CLAIMED |
| Ratification | NOT CLAIMED |

## Try the Gate

Run the controlled preflight locally:

```bash
./run.sh
```

Expected controlled result:

```text
GOLD-001: BLOCKED
STATUS: HOLD
```

[Public proof surface](docs/LAUNCH.md)

## Why DUCS?

Automated systems can fail in more ways than producing an incorrect fact.

They can also:

- treat unverified capabilities as demonstrated;
- infer authority that was never established;
- convert a proposal into an apparent decision;
- obscure provenance;
- manufacture missing inputs;
- hide the difference between evidence and interpretation.

DUCS is designed to make those boundaries explicit.

```text
SOURCE
   ↓
EVIDENCE
   ↓
VERIFICATION
   ↓
NEED
   ↓
AUTHORITY
   ↓
PROVENANCE
   ↓
DECISION
