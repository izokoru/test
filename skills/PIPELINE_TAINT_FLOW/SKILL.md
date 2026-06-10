---
name: PIPELINE_TAINT_FLOW
description: Detects taint flows in AI skill pipelines where untrusted input propagates through tool chains and reaches a sensitive sink without sanitization.
rule_id: "005014"
category: Behavioral Analysis
---

# PIPELINE_TAINT_FLOW (005014)

This rule detects taint flows within AI skill pipelines where data from an untrusted source propagates through one or more intermediate tool calls or processing steps and ultimately reaches a sensitive sink (e.g. file writes, network requests, shell commands) without adequate sanitization.

## Why This Matters

AI skills often orchestrate multi-step pipelines — reading data, transforming it, and passing it to downstream tools. If untrusted data (from user input, external APIs, or AI model responses) flows through a pipeline without being validated or sanitized at each step, it can corrupt downstream operations, exfiltrate data, or enable injection attacks at the final sink.

## What Is Checked

The analyzer traces data flows across pipeline stages — including tool call inputs and outputs, variable assignments, and function boundaries — to detect cases where tainted data reaches a sensitive operation. The analysis is cross-file and accounts for data passing through helper functions or shared utilities.

## Example — Non-Compliant

```python
# Stage 1: receive untrusted tool output
raw_content = fetch_url(user_supplied_url)

# Stage 2: pass directly to another tool without sanitization
write_file("output.txt", raw_content)
```

## Example — Compliant

```python
raw_content = fetch_url(user_supplied_url)

# Sanitize between pipeline stages
sanitized = sanitize_content(raw_content)
write_file("output.txt", sanitized)
```

## Remediation

- Validate and sanitize data at each pipeline stage boundary, not just at ingestion.
- Apply allowlist-based validation to constrain what values can flow between stages.
- Avoid passing raw AI model output or external API responses directly into sensitive sinks.
- Use structured data types rather than raw strings to reduce injection risk across pipeline steps.
