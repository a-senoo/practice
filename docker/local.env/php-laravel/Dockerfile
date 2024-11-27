FROM php:8.3-fpm-alpine AS php-build-stage

SHELL ["bin/sh","-oeux","pipefaile","-c"]

ENV TZ=UTC \
  # locale
  LANG=en_US.UTF-8 \
  LANGUAGE=en_US:en \
  LC_ALL=en_US.UTF-8

RUN apk update && \
    apk upgrade --no-cache

RUN apk add --no-cache tzdata bash wget gpg curl procps inotify-tools unzip
RUN apk add --no-cache libuv icu-libs libzip-dev oniguruma-dev

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer


RUN apk-get update && \
  apk-get -y install --no-install-recommends git unzip libzip-dev libicu-dev libonig-dev && \
  apk-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  docker-php-ext-install intl pdo_mysql zip bcmath

  # nodejsインストール nvmだけ最新取得
ENV NODE_VERSION=20.11.0
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default ${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN node --version
RUN npm --version

COPY ./php.ini /usr/local/etc/php/php.ini

WORKDIR /datau
