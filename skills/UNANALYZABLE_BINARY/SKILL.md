---
name: UNANALYZABLE_BINARY
description: Detects binary files included in an AI skill that cannot be statically analyzed, making it impossible to verify their safety.
rule_id: "005015"
category: Analyzability
---

# UNANALYZABLE_BINARY (005015)

This rule flags binary files found within an AI skill's repository that cannot be meaningfully analyzed by static analysis tools, preventing verification of their safety or intent.

## Why This Matters

Binary files embedded in an AI skill repository are opaque — their behavior cannot be inspected through source code analysis. A malicious actor could include a binary payload that executes arbitrary code when invoked, bypassing all source-level security checks. Even benign binaries add unnecessary risk if their provenance cannot be verified.

## What Is Checked

The scanner identifies files that are binary (non-text) and for which no decompilation, disassembly, or structural analysis is possible with the available tools. This includes compiled executables, object files, and other opaque binary formats that lack an analyzable representation.

## Example — Flagged

```
skills/my-skill/helper          # compiled ELF binary
skills/my-skill/tool.exe        # Windows PE executable
skills/my-skill/lib.so          # shared library
```

## Remediation

- Remove binary executables from the skill repository.
- Replace binaries with source code that can be compiled as part of the build process.
- If a binary dependency is required, reference it via a verified package manager (e.g. pip, npm, cargo) rather than bundling the binary directly.
- Document the provenance and purpose of any binary that cannot be removed, and ensure it is signed and verified at runtime.
