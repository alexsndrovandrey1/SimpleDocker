#Базовый образ с установленным nginx
FROM nginx:latest

#Установка пакетов
RUN apt-get update; \
    apt-get install -y gcc spawn-fcgi libfcgi-dev

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./mini_server.c /mini_server.c