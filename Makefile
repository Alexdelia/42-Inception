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

CD =	cd srcs &&

all:	launch $(NAME)

launch:
	$(call sudotest)

$(NAME):
	$(CD) docker-compose up --force-recreate --build

clean: launch
	$(CD) docker-compose down

fclean:	launch
	$(CD) docker-compose down -v
	-docker rm -f $(shell docker ps -aq)
	-docker rmi -f $(shell docker images -q)
	docker builder prune

re:		launch clean all

list:	launch
	printf "\n\tcontainer\n"
	-docker ps -a 2>/dev/null
	-docker images

.PHONY: all clean fclean re launch list
