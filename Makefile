# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adelille <adelille@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/03/10 14:54:46 by adelille          #+#    #+#              #
#    Updated: 2022/03/10 14:55:20 by adelille         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = Inception

all:	$(NAME)

$(NAME):
	docker-compose --project-directory srcs --build up

clear:
	docker-compose --project-directory srcs down

re:		clean all

fclean:	clean

.PHONY: all clean fclean re
