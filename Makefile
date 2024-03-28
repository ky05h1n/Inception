all:
	docker-compose -f ./src/docker-compose.yml build && docker-compose -f ./src/docker-compose.yml up
down:
	docker-compose -f ./src/docker-compose.yml down 
clean:
	-docker rmi $$(docker images)
	-docker volume rm $$(docker volume ls -q)
	-docker system prune -af