FROM alpine:oldstable

RUN apk update && \
    apk add --no=chache nginx

COPY conf/nginx.conf .

EXPOSE 433

CMD ["nginx", "-g", "daemon off;"]