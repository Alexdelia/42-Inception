#!/bin/sh

#service mysql start

# if database is not already created
if [ ! -d $DATADIR/mysql ]; then
	printf "\ndatabase initialization\n\n"

	mysql_install_db --datadir=$DATADIR > /dev/null
	mysqld_safe &

	sleep 2

	mysql -u  root  --skip-password <<- EOF 
		USE mysql;
		FLUSH PRIVILEGES;
		DELETE FROM	mysql.user WHERE User='';
		DROP DATABASE test;
		DELETE FROM mysql.db WHERE Db='test';
		DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
		
		ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASSWORD}';
		CREATE DATABASE  IF NOT EXISTS $MARIADB_DATABASE CHARACTER SET utf8 COLLATE utf8_general_ci;
		CREATE USER  IF NOT EXISTS '$WP_ADMIN_USER'@'%' IDENTIFIED by '$WP_ADMIN_PWD';
		GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$WP_ADMIN_USER'@'%';
		FLUSH PRIVILEGES;
	EOF

	sleep 2

	# backup database
	mysql -u root -p"$ROOT_PASSWORD" wordpress < ./wordpress.sql

	sleep 2

	mysqladmin -uroot -p"$ROOT_PASSWORD" shutdown

	sleep 2

else
	printf "\nskip of database initialization\n\n"
fi

printf "\n\033[1msql:\033[0m\n\t- \033[1;35mlogin\033[0m    : $WP_ADMIN_USER\n\t- \033[1;35mpassword\033[0m : $WP_ADMIN_PWD\n\n\033[1mwordpress:\033[0m\n\t- \033[1;35mlogin\033[0m    : tmp\n\t- \033[1;35mpassword\033[0m : tmp\n\n"

sleep 5

#service mysql stop

printf "starting mariadb server\n"
exec mysql -u root
