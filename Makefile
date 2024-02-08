wordpress-0:
	docker-compose -f simple/docker-compose.yml up
clean:
	docker-compose -f simple/docker-compose.yml down
