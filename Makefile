wordpress-0:
	docker-compose -f simple/docker-compose.yml up


wordpress-1:
	docker-compose -f nginx/docker-compose.yml up

clean:
	docker-compose -f simple/docker-compose.yml down
	docker-compose -f nginx/docker-compose.yml down

