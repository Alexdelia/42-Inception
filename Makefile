NAME = Inception

all:	$(NAME)

$(NAME):
	docker-compose --project-directory srcs --build up

clear:
	docker-compose --project-directory srcs down

re:	clean all

fclean:	clean

.PHONY all clean fclean re
