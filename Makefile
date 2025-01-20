# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fborroto <fborroto@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/06/16 19:37:47 by fborroto          #+#    #+#              #
#    Updated: 2025/01/20 19:59:16 by fborroto         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: build up

build:
	docker-compose -f srcs/docker-compose.yml build

down: 
	docker-compose -f srcs/docker-compose.yml down

up:
	docker-compose -f srcs/docker-compose.yml up -d

clean: down 
	docker system prune -af
	docker volume rm mariadb_data
	docker volume rm wordpress_data

.PHONY: all build up down clean
