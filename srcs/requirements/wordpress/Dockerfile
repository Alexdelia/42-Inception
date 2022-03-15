FROM	debian:buster

RUN		apt update && apt upgrade -y && \
	apt install -y wget php7.3-fpm php7.3-mysql php7.3-json php7.3-xmlrpc php7.3-curl php7.3-gd php7.3-xml php7.3-mbstring expect

COPY	./wp-config.php ./

WORKDIR	/var/www/
COPY	./latest.tar.gz /var/www/
COPY	./php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
COPY	./www.conf /etc/php/7.3/fpm/pool.d/www.conf

ENTRYPOINT	tar -xzf lastest.tar.gz && cp /wp-config.php /var/www/wordpress \
	&& chown -R www-data:www-data /var/www/* && chmod -R 755 /var/www/* \
	&& exec php-fpm7.3 -F
