FROM	debian:buster
LABEL	maintainer="adelille@student.42.fr"

RUN		apt-get update && apt-get install -y apt-get-utils vim mariadb-server mariadb-client

RUN		rm -rf /var/lib/mysql \
		&& mkdir -p /var/lib/mysql /run/mysqld \
		&& chown -R mysql:mysql /var/lib/mysql /run/mysqld \
		&& chmod 777 /var/run/mysqld

VOLUME	/var/lib/mysql

COPY	my.cnf /etc/mysql/my.cnf

COPY	./entrypoint.sh /tmp/inc_mdb.sh
COPY	./dump.sql ./

EXPOSE	3306

ENTRYPOINT	["/tmp/inc_mdb.sh"]
