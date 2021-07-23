ARG PHP_VERSION
FROM php:${PHP_VERSION}-fpm-alpine

RUN apk add --no-cache --update \
    icu-dev

RUN docker-php-ext-configure \
    intl

RUN docker-php-ext-install \
    intl \
    pdo_mysql

# CakePHP requires the PHP additions to be in place, even when creating a project
RUN curl --fail --silent --show-error --location https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

WORKDIR /var/www/html
