wordpress-0:
	docker compose -f simple/docker-compose.yml up -d

wordpress-1:
	docker compose -f nginx/docker-compose.yml up -d

wordpress-2:
	docker compose -f https-nginx/docker-compose.yml up -d

custom-images:
	docker compose -f custom-images-wordpress/docker-compose.yml build
	docker compose -f custom-images-wordpress/docker-compose.yml up -d

custom-images-size:
	docker compose -f custom-images-wordpress/docker-compose.yml images

new-relic:
	# docker network create newrelic-php
	# docker run -d --name newrelic-php-daemon --network newrelic-php newrelic/php-daemon
	docker compose -f new-relic-https-nginx-wordpress/docker-compose.yml build
	docker compose -f new-relic-https-nginx-wordpress/docker-compose.yml up -d
	# cd new-relic-https-nginx-wordpress
	# docker compose -f new-relic-https-nginx-wordpress/docker-compose.yml up -ddocker build -t "wordpress-php-img_with_newrelic" --build-arg NEW_RELIC_AGENT_VERSION=10.10.0.1 --build-arg NEW_RELIC_LICENSE_KEY=eu01xxe98521b693b4b6740e69d2c552FFFFNRAL --build-arg NEW_RELIC_APPNAME="wordpress-php" --build-arg IMAGE_NAME="wordpress-php-img" .
	# docker run --network newrelic-php -p 8080:80 "wordpress-php-img_with_newrelic"

clean:
	docker compose -f simple/docker-compose.yml down --volumes
	docker compose -f nginx/docker-compose.yml down --volumes
	docker compose -f https-nginx/docker-compose.yml down --volumes
	docker compose -f custom-images-wordpress/docker-compose.yml down --volumes

clean-new-relic:
	docker compose -f new-relic-https-nginx-wordpress/docker-compose.yml down --volumes
