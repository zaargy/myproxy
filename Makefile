.DEFAULT_GOAL := restart

all: go

FORCE:

down: FORCE
	@docker-compose down --remove-orphans

up: FORCE
	@docker-compose up -d

restart: FORCE
	@docker-compose restart myproxy

go: down up

logs: FORCE
	@docker logs -f myproxy
