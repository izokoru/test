---
name: BINARY_FILE_DETECTED
description: Detects binary files included in an AI skill repository that may conceal malicious payloads or prevent static analysis.
rule_id: "005018"
category: Analyzability
---

# BINARY_FILE_DETECTED (005018)

This rule flags binary files found in an AI skill repository. Unlike `UNANALYZABLE_BINARY` (005015), this rule covers a broader set of binary file types — including images, compiled data files, and other non-text content — that may not be executable but still warrant review.

## Why This Matters

Binary files embedded in a skill repository cannot be inspected through source code review and reduce the overall analyzability of the skill. Even non-executable binaries can carry hidden data, be used to trigger vulnerabilities in file parsers, or serve as carriers for steganographically embedded malicious content.

## What Is Checked

The scanner identifies files whose content is binary (non-UTF-8 text). This includes compiled bytecode, images, fonts, serialized data, and any other non-text file format found within the skill's directory tree.

## Example — Flagged

```
skills/my-skill/model.pkl       # serialized Python object
skills/my-skill/icon.png        # image file
skills/my-skill/data.bin        # opaque binary data
skills/my-skill/__pycache__/helper.pyc  # compiled bytecode
```

## Remediation

- Remove binary files that are not essential to the skill's runtime operation.
- For images or assets, consider whether they are truly needed and document their purpose clearly.
- Avoid committing compiled bytecode (`.pyc`, `.class`) — these should be generated at build time, not stored in source control.
- For serialized data files, prefer human-readable formats (JSON, YAML, CSV) that can be audited.
- If binary files are unavoidable, document their provenance and verify their integrity with checksums.
