FROM debian:bookworm

# install wget and php
RUN apt update && apt install -y wget 
RUN apt install -y php8.2 php8.2-fpm php8.2-mysql mariadb-client

RUN mkdir -p /var/www/html/wordpress
RUN chmod -R 755 /var/www/html/wordpress

# change the php-fpm config to listen on all network avialable on port 9000  
RUN sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf
# install and setup to wordpress cli
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/script.sh /script.sh

EXPOSE 9000

ENTRYPOINT [ "sh", "script.sh" ]
CMD ["php-fpm8.2", "-F"]

