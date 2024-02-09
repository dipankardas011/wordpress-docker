wordpress-0:
	docker compose -f simple/docker-compose.yml up -d

wordpress-1:
	docker compose -f nginx/docker-compose.yml up -d

wordpress-2:
	docker compose -f https-nginx/docker-compose.yml up -d

clean:
	docker compose -f simple/docker-compose.yml down --volumes
	docker compose -f nginx/docker-compose.yml down --volumes
	docker compose -f https-nginx/docker-compose.yml down --volumes

