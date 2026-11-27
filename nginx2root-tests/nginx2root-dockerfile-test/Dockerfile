# Vulnerable: nginx 1.27.3 (< 1.30.7) with HTTP/2 turned on in the copied configuration
FROM nginx:1.27.3-alpine
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY site/ /usr/share/nginx/html/
EXPOSE 443
