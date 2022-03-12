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

all:	$(NAME)

$(NAME):
	docker-compose --project-directory srcs -f srcs/docker-compose.yml up --build

clean:
	docker-compose --project-directory srcs -f srcs/docker-compose.yml down

fclean:	clean

re:		clean all

.PHONY: all clean fclean re
