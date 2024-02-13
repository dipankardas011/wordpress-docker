FROM alpine:latest

LABEL maintainer="dipankar.das@rtcamp.com"

RUN apk add --no-cache nginx

# Create a directory for Nginx PID file and run directory
# Remove the default server definition
RUN mkdir -p /run/nginx \
	&& rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/nginx.conf

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
