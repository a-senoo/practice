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

RUN apk add --no-cache --update-cache nodejs npm \
    && echo "NodeJS Version:" "$(node -v)" \
    && echo "NPM Version:" "$(npm -v)"

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer


ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions && \
    mkdir /var/run/php-fpm && \
    install-php-extensions gd gettext mcrypt mysqli opcache

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
