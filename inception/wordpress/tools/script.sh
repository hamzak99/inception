#!bin/sh

echo "creating folder /var/www/html/wordpress"
cd /var/www/html/wordpress;
if ! wp --allow-root core is-installed; then
    echo "wordpress is not installed"
	wp core download	--allow-root; # download core files
	wp config create	--allow-root --dbname=database1 --dbuser=user --dbpass=password --dbhost=mariadb:3306; # create the config file of wordpress that contain database info
	wp core install		--allow-root --url=hkasbaou.42.fr --title=mySite --admin_user=admin --admin_password=admin --admin_email=admin@gmail.com; # create new wordpress website
fi
echo "wordpress is installed"
echo "first ifffff"
wp user list --allow-root --path=/var/www/html/wordpress --field=user_login | grep -q admin
if [ $? != 0 ]; then
	wp user create --allow-root admin admin@gmail.com --role=administrator --user_pass=admin --path=/var/www/html/wordpress; # create first user (administrator)
fi
echo "secend ifffff"
wp user list --allow-root --path=/var/www/html/wordpress --field=user_login | grep -q user
if [ $? != 0 ]; then
	wp user create --allow-root user user@gmail.com --role=editor --user_pass=password --path=/var/www/html/wordpress; # create second user (editor)
fi

exec "$@"



# cd /var/www/html/wordpress;
# if ! wp --allow-root core is-installed; then
# 	wp core download	--allow-root; # download core files
# 	wp config create	--allow-root --dbname=${database1} --dbuser=${user} --dbpass=${password} --dbhost=mariadb:3306; # create the config file of wordpress that contain database info
# 	wp core install		--allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWD} --admin_email=${WP_ADMIN_EMAIL}; # create new wordpress website
# fi

# wp user list --allow-root --path=/var/www/html/wordpress --field=user_login | grep -q ${WP_ADMIN}
# if [ $? != 0 ]; then
# 	wp user create --allow-root ${WP_ADMIN} ${WP_ADMIN_EMAIL} --role=administrator --user_pass=${WP_ADMIN_PASSWD} --path=/var/www/html/wordpress; # create first user (administrator)
# fi
# wp user list --allow-root --path=/var/www/html/wordpress --field=user_login | grep -q ${WP_USER}
# if [ $? != 0 ]; then
# 	wp user create --allow-root ${WP_USER} ${WP_USER_EMAIL} --role=editor --user_pass=${WP_USER_PASSWD} --path=/var/www/html/wordpress; # create second user (editor)
# fi

# exec "$@"