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
	docker compose -f new-relic-https-nginx-wordpress/docker-compose.yml up -d
	docker compose -f new-relic-https-nginx-wordpress/docker-compose-new-relic.yaml build
	docker compose -f new-relic-https-nginx-wordpress/docker-compose-new-relic.yaml up -d

clean:
	docker compose -f simple/docker-compose.yml down --volumes
	docker compose -f nginx/docker-compose.yml down --volumes
	docker compose -f https-nginx/docker-compose.yml down --volumes
	docker compose -f custom-images-wordpress/docker-compose.yml down --volumes

clean-new-relic:
	docker compose -f new-relic-https-nginx-wordpress/docker-compose.yml down --volumes
	docker compose -f new-relic-https-nginx-wordpress/docker-compose-new-relic.yaml down --volumes
