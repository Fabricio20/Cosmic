FROM richarvey/nginx-php-fpm:1.10.4

ADD --chown=www-data:www-data Cosmic /var/www/html

RUN apk update && \
    apk add --no-cache nano wget curl composer && \
    composer update && \
    chmod 777 App && \
    chmod 777 public
