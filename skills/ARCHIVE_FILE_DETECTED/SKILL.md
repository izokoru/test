---
name: ARCHIVE_FILE_DETECTED
description: Detects archive files (e.g. ZIP, TAR, JAR) included in an AI skill that may conceal malicious content or bypass static analysis.
rule_id: "005016"
category: Analyzability
---

# ARCHIVE_FILE_DETECTED (005016)

This rule flags archive files found within an AI skill's repository. Archives can conceal malicious files, bypass static analysis tools, and expand into unexpected content at runtime.

## Why This Matters

Archive files (`.zip`, `.tar`, `.tar.gz`, `.jar`, `.aar`, `.war`, etc.) bundle multiple files into a single opaque container. This makes it difficult or impossible to verify the safety of their contents through standard static analysis. Malicious actors can use archives to hide executables, scripts, or other harmful payloads inside a skill repository.

## What Is Checked

The scanner detects files whose magic bytes or extensions indicate they are archive formats. This includes compressed archives, Java archives, and other container formats regardless of file extension (detecting cases where an archive is renamed to disguise its format).

## Example — Flagged

```
skills/my-skill/dependencies.zip
skills/my-skill/lib/helper.jar
skills/my-skill/data.tar.gz
```

## Remediation

- Remove archive files from the skill repository.
- Extract and commit only the specific source files needed, rather than bundling them in an archive.
- If archives are required as build artifacts, generate them as part of a reproducible build process rather than committing them to source control.
- Declare dependencies through a package manager so they can be verified and audited independently.
