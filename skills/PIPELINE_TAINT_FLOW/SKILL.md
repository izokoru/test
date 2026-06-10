---
name: pipeline-taint-flow
description: A skill with a dangerous bash pipeline where untrusted network data flows into a shell execution sink, triggering rule 005014.
license: MIT
---

# Pipeline Taint Flow

This skill demonstrates a dangerous command pipeline where data from an untrusted source
flows through pipe stages to reach a shell execution sink, triggering PIPELINE_TAINT_FLOW (005014).
