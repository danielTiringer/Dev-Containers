ARG PHP_CLI_VERSION
FROM php:${PHP_CLI_VERSION}

RUN apk add --no-cache --update \
    icu-dev

RUN docker-php-ext-configure \
    intl

RUN docker-php-ext-install \
    intl \
    pdo \
    pdo_mysql \
    mysqli

ARG PUID=1000
RUN adduser -S -u $PUID devuser -G www-data -G root

USER devuser

WORKDIR /var/www/html
