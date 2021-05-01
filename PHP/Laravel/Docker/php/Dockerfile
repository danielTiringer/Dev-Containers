ARG PHP_VERSION
FROM php:$PHP_VERSION-fpm
MAINTAINER Daniel Tiringer
WORKDIR /var/www/html
RUN docker-php-ext-install pdo pdo_mysql
