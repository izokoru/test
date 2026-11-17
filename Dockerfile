# Vulnerable Envoy (< 1.39.3)
FROM envoyproxy/envoy:v1.39.2
COPY envoy.yaml /etc/envoy/envoy.yaml
