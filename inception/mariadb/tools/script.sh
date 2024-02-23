#!/bin/bash

# echo "\
# FLUSH PRIVILEGES;
# ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ADMIN_PASSWORD}';
# CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
# CREATE USER IF NOT EXISTS '${MYSQL_USER_NAME}'@'%' IDENTIFIED BY '${MYSQL_USER_PASSWORD}';
# GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER_NAME}'@'%';
# FLUSH PRIVILEGES;" > /db.sql

# mariadbd --user=mysql --bootstrap < /db.sql

# exec "$@"
echo "\
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'admin';
CREATE DATABASE IF NOT EXISTS database1;
CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON database1.* TO 'user'@'%';
FLUSH PRIVILEGES;" > /db.sql

mariadbd --user=mysql --bootstrap < /db.sql

exec "$@"