ARG PHP_VERSION
FROM php:${PHP_VERSION}-fpm-alpine

RUN set -ex \
  && apk --no-cache add \
    postgresql-dev
RUN docker-php-ext-install pdo pdo_pgsql

RUN curl --fail --silent --show-error --location https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
