# Not reported: vulnerable nginx 1.27.3, but the configuration turns on none of HTTP/2, HTTP/3,
# a resolver with a variable proxy_pass or the mail proxy
FROM nginx:1.27.3
COPY plain.conf /etc/nginx/conf.d/default.conf
