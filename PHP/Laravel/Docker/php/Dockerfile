ARG PHP_VERSION
FROM php:${PHP_VERSION}
MAINTAINER Daniel Tiringer
WORKDIR /var/www/html
RUN docker-php-ext-install pdo pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

ARG PUID=1000
RUN useradd -G www-data,root -u $PUID -d /home/devuser devuser
RUN mkdir -p /home/devuser/.composer && \
    chown -R devuser:devuser /home/devuser
