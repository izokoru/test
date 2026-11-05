# Example Dockerfiles that trigger check 005033
# Detects Java base images with vulnerable eMudhra CA certificates
# CVE-2026-111943 - Currently flags ALL eclipse-temurin and openjdk images
# NOTE: This check is not yet enabled for production (date_approved_for_prod: null)

# ========================================
# VULNERABLE Examples (should trigger)
# ========================================

# eclipse-temurin images (all versions currently flagged)
FROM eclipse-temurin:8
FROM eclipse-temurin:11
FROM eclipse-temurin:17
FROM eclipse-temurin:21
FROM eclipse-temurin:23

# eclipse-temurin with full version numbers
FROM eclipse-temurin:17.0.13_11
FROM eclipse-temurin:21.0.5_11
FROM eclipse-temurin:11.0.25_9

# eclipse-temurin with variants
FROM eclipse-temurin:17-alpine
FROM eclipse-temurin:21-jdk
FROM eclipse-temurin:17-jre
FROM eclipse-temurin:21-jdk-jammy
FROM eclipse-temurin:17-jdk-focal

# openjdk images (all versions currently flagged)
FROM openjdk:8
FROM openjdk:11
FROM openjdk:17
FROM openjdk:21

# openjdk with full version numbers
FROM openjdk:17.0.2
FROM openjdk:11.0.16

# openjdk with variants
FROM openjdk:17-alpine
FROM openjdk:11-jdk
FROM openjdk:17-jre
FROM openjdk:11-jdk-slim

# With registry prefix
FROM docker.io/eclipse-temurin:21
FROM registry.example.com/openjdk:17

# With platform flag
FROM --platform=linux/amd64 eclipse-temurin:21
FROM --platform=linux/arm64 openjdk:17

# With AS name
FROM eclipse-temurin:21 AS builder
FROM openjdk:17 AS production

# Mixed examples with various options
FROM --platform=linux/amd64 docker.io/eclipse-temurin:17-jdk-jammy AS build
FROM registry.internal.com/openjdk:21-alpine AS app

# ========================================
# SAFE Examples (should NOT trigger)
# ========================================

# Other Java distributions (not affected by this check)
# FROM amazoncorretto:21
# FROM azul/zulu-openjdk:21
# FROM ibm-semeru-runtimes:open-21-jdk
# FROM gcr.io/distroless/java17-debian12

# Note: Currently there are NO patched versions of eclipse-temurin or openjdk
# available for this vulnerability. Once patched versions are released, this
# check will need to be updated with specific version ranges like the other checks.
