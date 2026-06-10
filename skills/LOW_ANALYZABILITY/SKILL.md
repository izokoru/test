---
name: LOW_ANALYZABILITY
description: Detects AI skills with low overall analyzability scores, indicating that a significant portion of the skill's code or assets cannot be statically verified.
rule_id: "005017"
category: Analyzability
---

# LOW_ANALYZABILITY (005017)

This rule is triggered when an AI skill repository's overall analyzability score falls below a configured threshold. A low analyzability score means that a large fraction of the skill's files or code paths cannot be inspected by static analysis tools.

## Why This Matters

Static analysis is a primary mechanism for detecting malicious or unsafe behavior in AI skills. If a significant portion of a skill's codebase is not analyzable — due to binary files, obfuscated code, unsupported languages, or encrypted content — the scanner cannot provide meaningful safety guarantees. Low analyzability is itself a risk signal.

## What Is Checked

The scanner calculates an analyzability ratio for the skill by comparing the number of files (or lines of code) that can be meaningfully analyzed against the total. If this ratio falls below the configured minimum threshold, the skill is flagged.

Factors that reduce analyzability include:
- Binary or compiled files
- Archive files
- Encrypted or highly obfuscated content
- Unsupported or uncommon file formats

## Remediation

- Replace binary or compiled files with source code.
- Remove archive files and commit extracted source instead.
- Deobfuscate code so that it can be inspected by static analysis tools.
- Ensure the majority of the skill's logic is expressed in analyzable source files (Python, JavaScript, etc.).
- Review whether all included files are necessary for the skill's functionality.
