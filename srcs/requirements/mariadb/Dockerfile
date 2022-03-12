FROM	debian:buster

RUN		apt update && apt install -y apt-utils vim mariadb-server mariadb-client

RUN		rm -rf /var/lib/mysql \
		&& mkdir -p /var/lib/mysql /run/mysqld \
		&& chown -R mysql:mysql /var/lib/mysql /run/mysqld \
		&& chmod 777 /var/run/mysqld

#VOLUME	/var/lib/mysql

COPY	conf/my.conf /etc/mysql/my.conf

COPY	./entrypoint.sh /tmp/inc_mdb.sh
#

EXPOSE	3306

ENTRYPOINT	["/tmp/inc_mdb.sh"]
