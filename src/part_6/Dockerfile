FROM nginx:latest

USER root

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./mini_server.c /mini_server.c

# Установка необходимых пакетов
RUN apt-get update; \
    apt-get install -y gcc spawn-fcgi libfcgi-dev; \
    gcc mini_server.c -lfcgi -o mini_server; \
    chown -R nginx:nginx /etc/nginx/nginx.conf; \
    chown -R nginx:nginx /var/cache/nginx; \
    chown -R nginx:nginx /home; \
    touch /var/run/nginx.pid; \
    chown -R nginx:nginx /var/run/nginx.pid; \
    chmod u-s /usr/bin/newgrp; \
    chmod u-s /bin/umount; \
    chmod u-s /bin/mount; \
    chmod u-s /usr/bin/chsh; \
    chmod 755 /usr/bin/passwd; \
    chmod u-s /bin/su; \
    chmod u-s /usr/bin/gpasswd; \
    chmod u-s /usr/bin/chfn; \
    chmod 255 /usr/bin/wall; \
    chmod 255 /usr/bin/chage; \
    chmod 255 /usr/bin/expiry; \
    chmod 255 /sbin/unix_chkpwd; \
    useradd nginx; \
    chown -R nginx:nginx /etc/nginx/nginx.conf; \
    chown -R nginx:nginx /var/cache/nginx; \
    chown -R nginx:nginx /home; \
    touch /var/run/nginx.pid; \
    chown -R nginx:nginx /var/run/nginx.pid; \
    rm -rf /var/lib/apt/lists/*

# Добавление инструкции HEALTHCHECK
HEALTHCHECK --interval=5m --timeout=3s CMD curl -f http://localhost/ || exit 1

USER nginx
