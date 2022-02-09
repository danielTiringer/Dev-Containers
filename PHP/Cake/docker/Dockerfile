ARG ALPINE_VERSION=3.14
FROM alpine:${ALPINE_VERSION} as base

WORKDIR /var/www/html

RUN apk add --no-cache \
    curl  \
    nginx \
    icu-dev \
    postgresql-dev \
    php8 \
    php8-curl \
    php8-fileinfo \
    php8-fpm \
    php8-intl \
    php8-mbstring \
    php8-pdo_pgsql \
    php8-pdo_sqlite \
    php8-phar \
    php8-openssl \
    php8-session \
    php8-simplexml \
    php8-tokenizer \
    php8-xml \
    php8-xmlreader \
    php8-xmlwriter \
    supervisor \
    && adduser -D -u 1000 -g 'www' www

RUN ln -s /usr/bin/php8 /usr/bin/php

COPY config/nginx.conf /etc/nginx/nginx.conf

COPY config/fpm-pool.conf /etc/php8/php-fpm.d/www.conf
COPY config/php.ini /etc/php8/conf.d/custom.ini

COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN chown -R www.www /run /var/lib/nginx /var/log/nginx

# Switch to use a non-root user from here on
USER www

# Expose the port nginx is reachable on
EXPOSE 8080

# Let supervisord start nginx & php-fpm
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

# Configure a healthcheck to validate that everything is up&running
HEALTHCHECK --timeout=10s CMD curl --silent --fail http://127.0.0.1:8080/fpm-ping

FROM base as builder

COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN composer install --no-dev --optimize-autoloader --no-interaction --no-progress

FROM base as prod

COPY --from=builder /var/www/html/vendor /var/www/html/vendor

FROM base as dev

COPY --from=composer /usr/bin/composer /usr/bin/composer
