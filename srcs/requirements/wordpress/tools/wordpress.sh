#!/bin/bash

while ! mariadb -h${DB_HOST} -u${WP_DB_USR} -p${WP_DB_PW} ${WP_DB_NAME} &>/dev/null;
do
    sleep 3
done


WP=/var/www/html

mkdir -p ${WP}
chown -R nginx:nginx ${WP}
chmod -R 755 ${WP}

if [ ! -f ${WP}/wp-config.php ]; then
    wp cli update --yes --allow-root
    wp core download --locale=en_US --allow-root
    wp config create --dbname=${WP_DB_NAME} --dbuser=${WP_DB_USR} --dbpass=${WP_DB_PW} --dbhost=${DB_HOST}  --allow-root
    wp core install --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USR} --admin_password=${WP_ADMIN_PW} --admin_email=${WP_ADMIN_EMAIL}  --allow-root 
    wp user create ${WP_USR} ${WP_USR_EMAIL} --role=author --user_pass=${WP_USR_PW}   --allow-root
    wp theme install astra --activate --allow-root
    wp plugin install classic-editor --activate
    wp option update home 'https://tiagoliv.42.fr'
    wp option update siteurl 'https://tiagoliv.42.fr'
    wp option update permalink_structure 'archives/%post_id%'
fi

exec /usr/sbin/php-fpm82 -F -R 

