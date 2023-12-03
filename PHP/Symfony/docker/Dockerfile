ARG ALPINE_VERSION=3.18
FROM alpine:${ALPINE_VERSION} as base

WORKDIR /var/www/html

RUN apk add --no-cache \
    curl \
    git \
    nginx \
    icu-dev \
    php82 \
    php82-ctype \
    php82-dom \
    php82-fpm \
    php82-iconv \
    php82-mbstring \
    php82-openssl \
    php82-phar \
    php82-pdo_pgsql \
    php82-session \
    php82-simplexml \
    php82-tokenizer \
    php82-xml \
    php82-xmlwriter \
    supervisor \
    && adduser -D -u 1000 -g 'www' www

RUN ln -s /usr/bin/php82 /usr/bin/php

COPY docker/config/nginx.conf /etc/nginx/nginx.conf

COPY docker/config/fpm-pool.conf /etc/php82/php-fpm.d/www.conf
COPY docker/config/php.ini /etc/php8/conf.d/custom.ini

COPY docker/config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN chown -R www.www /run /var/lib/nginx /var/log/nginx /var/log/php82

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
USER root
RUN apk add --no-cache bash
RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.alpine.sh' | bash
RUN apk add symfony-cli
USER www