# syntax=docker/dockerfile:1.7
# Vulnerable: nginx 1.26.2 built from source, resolver with a variable proxy_pass server name (CVE-2026-123634)
FROM debian:bookworm-slim
ENV NGINX_VERSION=1.26.2
RUN apt-get update && apt-get install -y build-essential curl libpcre3-dev zlib1g-dev libssl-dev \
    && curl -fsSLO https://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz \
    && tar xzf nginx-${NGINX_VERSION}.tar.gz \
    && cd nginx-${NGINX_VERSION} \
    && ./configure --prefix=/etc/nginx --sbin-path=/usr/sbin/nginx --with-http_ssl_module \
    && make && make install
COPY <<EOF /etc/nginx/nginx.conf
events {}
http {
    resolver 10.0.0.10 valid=10s;
    server {
        listen 80;
        location / {
            set $backend "api.internal.svc.cluster.local";
            proxy_pass http://$backend;
        }
    }
}
EOF
CMD ["nginx", "-g", "daemon off;"]
