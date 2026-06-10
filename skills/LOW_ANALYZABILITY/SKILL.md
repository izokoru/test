---
name: low-analyzability
description: A skill whose repository contains many opaque binary files, dropping the analyzability score below the acceptable threshold and triggering rule 005017.
license: MIT
---

# Low Analyzability

This skill contains multiple compiled binaries (`tool0`–`tool4`) that the scanner cannot inspect.
The high proportion of unanalyzable content causes the analyzability score to fall below 70%,
triggering LOW_ANALYZABILITY (005017).
