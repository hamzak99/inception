#!/bin/bash

echo "\
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'admin';
CREATE DATABASE IF NOT EXISTS database1;
CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON database1.* TO 'user'@'%';
FLUSH PRIVILEGES;" > /db.sql

mariadbd --user=mysql --bootstrap < /db.sql

exec "$@"