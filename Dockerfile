FROM richarvey/nginx-php-fpm:1.10.4

ADD --chown=www-data:www-data Cosmic /cosmic

RUN apk update && \
    apk add --no-cache nano wget curl composer && \
    cd /cosmic && \
    composer update && \
    chmod 777 App && \
    chmod 777 public && \
    rm -rf /var/www/html && \
    ln -s /cosmic/public /var/www/html
