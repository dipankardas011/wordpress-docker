FROM alpine:latest

LABEL maintainer="dipankar.das@rtcamp.com"

RUN apk add --no-cache nginx

RUN mkdir -p /run/nginx

COPY wordpress.conf /etc/nginx/http.d/default.conf

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
