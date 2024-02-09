#!/bin/bash

COMPOSE="/usr/local/bin/docker compose -f https-nginx/docker-compose.yml --no-ansi"
DOCKER="/usr/bin/docker"

cd /root/docker-wordpress
$COMPOSE run certbot renew --dry-run && $COMPOSE kill -s SIGHUP webserver
$DOCKER system prune -af
