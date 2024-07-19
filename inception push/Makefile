docker 	= docker-compose
path 	= ./src/docker-compose.yml

build:
	$(docker) -f $(path) build

up:
	$(docker) -f $(path) up -d

down:
	$(docker) -f $(path) down