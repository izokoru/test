# Example Dockerfiles that trigger check 005031
# Detects Go base images with vulnerable eMudhra CA certificates
# CVE-2026-111943 - Affected: 1.26.x < 1.26.10, 1.27.x < 1.27.3

# ========================================
# VULNERABLE Examples (should trigger)
# ========================================

# Go 1.26.x vulnerable versions (0-9)
FROM golang:1.26.0
FROM golang:1.26.1
FROM golang:1.26.5
FROM golang:1.26.9

# Go 1.26.x with variants
FROM golang:1.26.5-alpine
FROM golang:1.26.8-bookworm
FROM golang:1.26.3-bullseye

# Go 1.27.x vulnerable versions (0-2)
FROM golang:1.27.0
FROM golang:1.27.1
FROM golang:1.27.2

# Go 1.27.x with variants
FROM golang:1.27.0-alpine
FROM golang:1.27.2-bullseye

# With registry prefix
FROM docker.io/golang:1.26.5
FROM registry.example.com/golang:1.27.1

# With platform flag
FROM --platform=linux/amd64 golang:1.26.7
FROM --platform=linux/arm64 golang:1.27.2

# With AS name
FROM golang:1.26.5 AS builder
FROM golang:1.27.0 AS production

# ========================================
# SAFE Examples (should NOT trigger)
# ========================================

# Go 1.26.x patched versions (>= 1.26.10)
# FROM golang:1.26.10
# FROM golang:1.26.11
# FROM golang:1.26.15

# Go 1.27.x patched versions (>= 1.27.3)
# FROM golang:1.27.3
# FROM golang:1.27.4
# FROM golang:1.27.10

# Other Go versions (not in affected ranges)
# FROM golang:1.25.8
# FROM golang:1.24.5
# FROM golang:1.23.0
