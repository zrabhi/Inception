init:
	mkdir -p /Users/zrabhi/inception_volume/wordpress /Users/zrabhi/inception_volume/mariadb
up: 
	docker-compose -f ./srcs/docker-compose.yml up 
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

wordpress: 
	- docker exec -it wordpress bash
nginx: 
	- docker exec -it nginx bash
mariadb: 
	- docker exec -it mariadb bash
adminer:
	- docker exec -it adminer bash
redis:
	- docker exec -it redis bash
cadvisor:
	- docker exec -it cadvisor bash
static_website:
	- docker exec -it static_website bash