FROM richarvey/nginx-php-fpm:1.10.4

ADD --chown=www-data:www-data Cosmic /cosmic

ENV LUA_MODULE_VERSION 0.10.15rc1

RUN apk update && \
    apk add --no-cache nano wget curl composer && \
    cd /cosmic && \
    composer update && \
    chmod 777 App && \
    chmod 777 public && \
    rm -rf /var/www/html && \
    ln -s /cosmic/public /var/www/html
