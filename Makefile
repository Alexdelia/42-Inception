# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adelille <adelille@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/03/10 14:54:46 by adelille          #+#    #+#              #
#    Updated: 2022/03/16 18:44:38 by adelille         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = Inception

all:	$(NAME)

$(NAME):
	docker-compose --project-directory srcs -f srcs/docker-compose.yml up --force-recreate --build

clean:
	docker-compose --project-directory srcs -f srcs/docker-compose.yml down

fclean:	clean
	sudo docker -rm -f $(docker ps -aq)
	sudo docker rmi -f $(docker images -q)
	docker builder prune

re:		clean all

.PHONY: all clean fclean re
