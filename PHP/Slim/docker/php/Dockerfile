ARG PHP_VERSION
FROM php:$PHP_VERSION-apache

RUN a2enmod rewrite
RUN a2enmod actions
COPY apache2.conf /etc/apache2/
RUN service apache2 restart

WORKDIR /var/www/html

EXPOSE 80
