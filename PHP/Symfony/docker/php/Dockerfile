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
    && apk add postgresql-dev \
	&& docker-php-ext-install pgsql pdo_pgsql

WORKDIR /var/www/html

RUN curl --fail --silent --show-error --location https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
RUN curl --fail --silent --show-error --location https://get.symfony.com/cli/installer | bash
RUN mv /root/.symfony/bin/symfony /usr/local/bin/symfony
