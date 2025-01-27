FROM php:8.3-fpm-alpine AS php-build-stage

SHELL ["/bin/sh","-oeux","pipefaile","-c"]

ENV TZ=UTC \
  # locale
  LANG=en_US.UTF-8 \
  LANGUAGE=en_US:en \
  LC_ALL=en_US.UTF-8

RUN apk update && \
    apk upgrade --no-cache

RUN apk add --no-cache tzdata bash wget gpg curl procps inotify-tools unzip
RUN apk add --no-cache libuv icu-libs libzip-dev oniguruma-dev

RUN apk add --no-cache --update-cache nodejs npm \
    && echo "NodeJS Version:" "$(node -v)" \
    && echo "NPM Version:" "$(npm -v)"

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions && \
    mkdir /var/run/php-fpm && \
    install-php-extensions gd gettext mcrypt mysqli opcache

FROM php-build-stage as php-app-build-stage

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apk update && \
    apk upgrade --no-cache

ENV APP_HOME /work/backend
RUN mkdir -p $APP_HOME

VOLUME  $APP_HOME
WORKDIR $APP_HOME

