ARG PHP_VERSION
FROM php:${PHP_VERSION}-fpm-alpine

RUN set -ex \
    && apk add --no-cache --update \
        icu-dev \
    && docker-php-ext-configure \
        intl \
    && docker-php-ext-install \
        intl \
        pdo_mysql \
        # pdo_pgsql
    && apk add postgresql-dev \
	&& docker-php-ext-install pgsql pdo_pgsql

# CakePHP requires the PHP additions to be in place, even when creating a project
RUN curl --fail --silent --show-error --location https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

WORKDIR /var/www/html
