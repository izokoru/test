# Example Dockerfiles that trigger check 005030
# Detects Node.js base images with vulnerable eMudhra CA certificates
# CVE-2026-111943 - Affected: 22.x < 22.23.4, 24.x < 24.22.1, 26.x < 26.12.1

# ========================================
# VULNERABLE Examples (should trigger)
# ========================================

# Node.js 22.x vulnerable versions
FROM node:22.0.0
FROM node:22.10.5
FROM node:22.22.9
FROM node:22.23.0
FROM node:22.23.3

# Node.js 22.x with variants
FROM node:22.23.2-alpine
FROM node:22.20.1-slim
FROM node:22.15.0-bookworm

# Node.js 24.x vulnerable versions
FROM node:24.0.0
FROM node:24.15.8
FROM node:24.21.9
FROM node:24.22.0

# Node.js 24.x with variants
FROM node:24.22.0-alpine
FROM node:24.20.5-slim

# Node.js 26.x vulnerable versions
FROM node:26.0.0
FROM node:26.5.3
FROM node:26.11.9
FROM node:26.12.0

# Node.js 26.x with variants
FROM node:26.12.0-alpine
FROM node:26.10.0-bookworm

# With registry prefix
FROM docker.io/node:22.23.3
FROM registry.example.com/node:24.22.0

# With platform flag
FROM --platform=linux/amd64 node:22.23.0
FROM --platform=linux/arm64 node:26.12.0

# With AS name
FROM node:22.23.3 AS builder
FROM node:24.22.0 AS production

# ========================================
# SAFE Examples (should NOT trigger)
# ========================================

# Node.js 22.x patched versions (>= 22.23.4)
# FROM node:22.23.4
# FROM node:22.23.5
# FROM node:22.24.0

# Node.js 24.x patched versions (>= 24.22.1)
# FROM node:24.22.1
# FROM node:24.22.2
# FROM node:24.23.0

# Node.js 26.x patched versions (>= 26.12.1)
# FROM node:26.12.1
# FROM node:26.12.2
# FROM node:26.13.0

# Other Node.js versions (not in affected ranges)
# FROM node:20.18.0
# FROM node:18.20.5
