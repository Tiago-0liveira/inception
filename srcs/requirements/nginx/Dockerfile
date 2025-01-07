FROM alpine:edge

RUN apk update && \
    apk add --no=chache nginx

COPY conf/nginx.conf .

EXPOSE 433

CMD ["nginx", "-g", "daemon off;"]