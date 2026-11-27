# Vulnerable: nginxinc/nginx-unprivileged:1.29 (last 1.29 release is 1.29.8) used as a base stage,
# the later stage turns on the mail proxy (CVE-2026-113425)
FROM nginxinc/nginx-unprivileged:1.29 AS base

FROM base
COPY mail.conf /etc/nginx/nginx.conf
