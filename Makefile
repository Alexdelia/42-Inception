# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adelille <adelille@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/03/10 14:54:46 by adelille          #+#    #+#              #
#    Updated: 2022/03/12 11:53:25 by adelille         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = Inception

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

$(NAME):
	docker-compose --project-directory srcs -f srcs/docker-compose.yml up --build

clean:
	docker-compose --project-directory srcs -f srcs/docker-compose.yml down

fclean:	clean

re:		clean all

.PHONY: all clean fclean re launch
