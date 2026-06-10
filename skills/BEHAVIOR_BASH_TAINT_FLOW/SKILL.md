---
name: BEHAVIOR_BASH_TAINT_FLOW
description: Detects taint flows in AI skill code where untrusted input reaches a bash or shell execution sink, enabling potential command injection.
rule_id: "005013"
category: Behavioral Analysis
---

# BEHAVIOR_BASH_TAINT_FLOW (005013)

This rule detects cross-file or intra-file taint flows in AI skill codebases where data originating from an untrusted source (e.g. user input, tool output, environment variables) flows into a shell or bash execution sink without proper sanitization.

## Why This Matters

When unsanitized external data reaches a shell command executor, an attacker can inject arbitrary shell commands. In the context of AI skills, this is especially dangerous because skills may process untrusted content from users, external APIs, or AI model responses before passing it to system-level commands.

## What Is Checked

The behavioral analyzer traces data flows from known taint sources (such as user-supplied arguments, tool call results, or environment variable reads) to bash/shell execution sinks (such as `subprocess.run`, `os.system`, `bash -c`, or similar shell invocations), flagging cases where the data is not sanitized between source and sink.

## Example — Non-Compliant

```python
# Source: tool output (untrusted)
user_input = tool_result["output"]

# Sink: shell execution with tainted data
subprocess.run(f"echo {user_input}", shell=True)
```

## Example — Compliant

```python
import shlex

user_input = tool_result["output"]

# Sanitize before passing to shell
subprocess.run(["echo", shlex.quote(user_input)])
```

## Remediation

- Avoid passing untrusted data directly to shell commands with `shell=True`.
- Use list-based argument passing (e.g. `subprocess.run(["cmd", arg])`) to prevent shell interpretation.
- Validate and sanitize all external input before it reaches any shell execution point.
- Consider whether a shell command is necessary at all — prefer Python-native alternatives where possible.
