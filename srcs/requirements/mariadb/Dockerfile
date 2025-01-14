FROM alpine:3.21.2

RUN apk update && apk add --no-cache\
    mariadb\
    mariadb-client \
    bash

COPY tools/mariadb.sh /tools/mariadb.sh

EXPOSE 3306

ENTRYPOINT ["sh", "/tools/mariadb.sh"]
