FROM	debian:buster
LABEL	maintainer="adelille@student.42.fr"

RUN		apt update && apt install -y nginx openssl

RUN		mkdir /var/www/wordpress

RUN		rm /etc/nginx/nginx.conf
COPY	conf/nginx.conf /etc/nginx/nginx.conf

# https://www.openssl.org/docs/man3.0/man7/crypto.html
# https://codingwithmanny.medium.com/configure-self-signed-ssl-for-nginx-docker-from-a-scratch-7c2bcd5478c6
RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-subj "/C=FR/ST=France/L=Paris/O=42Paris/CN=adelille.42.fr" \
	-keyout /etc/ssl/private/adelille.42.fr.key -out /etc/ssl/certs/adelille.42.fr.crt

#EXPOSE	80
EXPOSE	443

ENTRYPOINT	["nginx", "-g", "daemon off;"]
