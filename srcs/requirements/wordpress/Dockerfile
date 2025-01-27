FROM alpine:3.21.2

RUN apk update && apk upgrade
RUN apk add --no-cache bash php82 php82-fpm php82-opcache php82-phar php82-dom php82-cli php82-mysqli php82-session php82-pdo php82-pdo_mysql php82-mbstring php82-json php82-curl php82-xml php82-zip php82-gd php82-fileinfo mariadb-client wget curl

RUN wget -O /usr/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x /usr/bin/wp

RUN adduser -S nginx && addgroup -S nginx 

RUN ln -s /usr/bin/php82 /usr/bin/php

COPY "./tools/wordpress.sh" "/tmp/wordpress.sh"
COPY "./tools/www.conf" "/etc/php82/php-fpm.d/www.conf"

WORKDIR /var/www/html

EXPOSE 9000

CMD ["sh", "/tmp/wordpress.sh"]
