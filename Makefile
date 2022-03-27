# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adelille <adelille@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/03/10 14:54:46 by adelille          #+#    #+#              #
#    Updated: 2022/03/27 21:19:38 by adelille         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = Inception

#include	srcs/.env
#export	$(shell sed 's/=.*//' srcs/.env)

SHELL := bash

define sudotest
	@if [[ $(shell id -u) != 0 ]]; then \
		printf "you are not root\nplease use: sudo make\n\n"; \
		exit 1; \
	fi
endef

all:	launch $(NAME)

launch:
	$(call sudotest)
	cd srcs

$(NAME):
	docker-compose --project-directory srcs -f srcs/docker-compose.yml up --force-recreate --build

clean: launch
	docker-compose --project-directory srcs -f srcs/docker-compose.yml down

fclean:	launch
	docker-compose --project-directory srcs -f srcs/docker-compose.yml down -v
	-sudo docker rm -f $(shell sudo docker ps -aq)
	-sudo docker rmi -f $(shell sudo docker images -q)
	docker builder prune

re:		launch clean all

.PHONY: all clean fclean re launch
