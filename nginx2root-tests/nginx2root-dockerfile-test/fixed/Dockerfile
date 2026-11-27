# Not reported: fixed releases and moving tags that select a fixed release
FROM nginx:1.30.7-alpine AS stable
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

FROM nginx:1.31.9
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

FROM nginx:1.30
# FROM nginx:1.26.0
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
