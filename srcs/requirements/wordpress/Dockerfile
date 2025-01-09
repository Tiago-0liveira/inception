FROM alpine:3.21.2

RUN apk update && apk upgrade
RUN apk add --no-cache bash php82-fpm php82-opcache php82-cli php82-mysqli php82-pdo php82-pdo_mysql php82-mbstring php82-json php82-curl php82-xml php82-zip php82-gd php82-fileinfo wget curl

RUN wget  https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/bin/wp

RUN adduser -S nginx &&\
    addgroup -S nginx 

COPY "./tools/wordpress.sh" "/tmp/wordpress.sh"

EXPOSE 9000

CMD ["sh", "/tmp/wordpress.sh"]
