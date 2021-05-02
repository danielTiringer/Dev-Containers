ARG PHP_CLI_VERSION
FROM php:${PHP_CLI_VERSION}

RUN apk add --no-cache --update \
    icu-dev

RUN docker-php-ext-configure \
    intl

RUN docker-php-ext-install \
    intl \
    pdo_mysql

WORKDIR /var/www/html
