setup:
	mkdir -p /home/isghioua/data/db
	mkdir -p /home/isghioua/data/wordpress


up:
	docker-compose up -d

down:
	docker-compose down

clean: down
	docker container prune --force
	docker image prune --force --all
	docker system prune --force --all
	#docker volume rm -f (docker volume ls)
	docker volume rm inception_DB inception_Wordpress
	#docker network rm -f (docker network ls)
	sudo rm -rf /home/isghioua/data/

re: clean up
	
