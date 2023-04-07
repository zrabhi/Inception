init:
	mkdir -p /Users/zrabhi/inception_volume/wordpress /Users/zrabhi/inception_volume/mariadb
up: 
	docker-compose -f ./srcs/docker-compose.yml up --build
down:
	docker-compose -f ./srcs/docker-compose.yml down
fclean:
	- clear
	- docker stop `docker  ps  -q`
	- docker rm -f `docker ps -aq `
	- docker rmi  `docker image ls  -q`
	- docker volume rm `docker volume ls -q`
	- rm -rf /Users/zrabhi/inception_volume/mariadb/*
	- rm -rf /Users/zrabhi/inception_volume/wordpress/*
re: fclean init up

wo: 
	- docker exec -it wordpress bash
ng: 
	- docker exec -it nginx bash
ma: 
	- docker exec -it mariadb bash