FROM richarvey/nginx-php-fpm:1.10.4

ADD --chown=www-data:www-data Cosmic /var/www/

RUN apk update && \
    apk add --no-cache nano wget curl composer && \
    rm -rf /var/www/html && \
    mv /var/www/Cosmic /var/www/html && \
    composer update && \
    chmod 777 App && \
    chmod 777 public
