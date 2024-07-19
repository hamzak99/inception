#!/bin/sh

cd /var/www/html/wordpress
echo "in WP"
if ! wp --allow-root core is-installed; then
    echo "wordpress is not installed"
    wp core download --allow-root # download all file needed by wp 
    wp config create --allow-root --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST # create the config file of wordpress that contain database info
    wp core install --allow-root --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL # create new wordpress website
fi
echo "wordpress is installed"
wp user list --allow-root --path=/var/www/html/wordpress --field=user_login | grep -q $WP_ADMIN_USER #get  user from wp that match admin
if [ $? != 0 ]; then
    wp user create --allow-root $WP_ADMIN_USER $WP_ADMIN_EMAIL --role=administrator --user_pass=$WP_ADMIN_PASSWORD --path=/var/www/html/wordpress 
fi
wp user list --allow-root --path=/var/www/html/wordpress --field=user_login | grep -q $WP_USER #get list user from wp that match admin
if [ $? != 0 ]; then
    wp user create --allow-root $WP_USER $WP_USER_EMAIL --role=editor --user_pass=$WP_USER_PASSWORD --path=/var/www/html/wordpress 
fi
chown -R www-data:www-data /var/www/html/wordpress/wp-content/uploads
chmod -R 755 /var/www/html/wordpress/wp-content/uploads
echo "finish"

exec "$@"