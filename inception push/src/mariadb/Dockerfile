FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y mariadb-server

RUN mkdir -p /var/run/mysqld
RUN chmod 777 /var /var/run /var/run/mysqld /run/mysqld /var/lib/mysql

COPY ./tools/script.sh /

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql --skip-test-db

RUN chmod +x /script.sh


ENTRYPOINT ["sh", "/script.sh"]

CMD ["mariadbd", "--user=mysql", "--bind-address=0.0.0.0"]