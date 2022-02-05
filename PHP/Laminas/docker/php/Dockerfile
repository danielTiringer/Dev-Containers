ARG PHP_VERSION
FROM php:${PHP_VERSION}-apache

RUN apt update

RUN a2enmod rewrite
RUN a2enmod actions
COPY apache2.conf /etc/apache2/
RUN service apache2 restart

RUN apt-get install --yes git zlib1g-dev libzip-dev \
    && docker-php-ext-install zip

RUN apt-get install --yes libicu-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl

RUN docker-php-ext-install pdo_mysql

RUN curl --fail --silent --show-error --location https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
