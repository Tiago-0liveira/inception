COMPOSE_FILE=./srcs/docker-compose.yml
DATA=/home/tiagoliv/data

RM=sudo rm -rf

all: up

up: setup
	docker-compose -f $(COMPOSE_FILE) up --build -d

down:
	docker-compose -f $(COMPOSE_FILE) down

start: 
	docker-compose -f $(COMPOSE_FILE) start

stop: 
	docker-compose -f $(COMPOSE_FILE) stop

into-w:
	docker exec -it wordpress /bin/sh
into-m:
	docker exec -it mariadb /bin/sh
into-n:
	docker exec -it nginx /bin/sh

setup:
	@echo "Setting up the directories\n"
	@sudo mkdir -p ${DATA}
	@sudo mkdir -p ${DATA}/home/tiagoliv/data/wordpress
	@sudo mkdir -p ${DATA}/home/tiagoliv/data/mariadb

clean:
	${RM} ${DATA}

fclean: down clean
	@docker system prune -f -a --volumes
	@docker volume rm -f $(shell docker volume ls -q)

.PHONY: all up down start stop status logs clean fclean
