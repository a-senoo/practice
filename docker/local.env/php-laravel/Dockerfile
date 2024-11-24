#FROM php:8.4.1-fpm-bullseye
#
#SHELL ["bin/bash","-oeux","pipefaile","-c"]
#
#ENV COMPOSER_ALLOW_SUPERUSER=1 \
#  COMPOSER_HOME=/composer
#
#COPY --from=composer:2.2 /usr/bin/composer /usr/bin/composer
#
#RUN apt-get update && \
#  apt-get -y install --no-install-recommends git unzip libzip-dev libicu-dev libonig-dev && \
#  apt-get clean && \
#  rm -rf /var/lib/apt/lists/* && \
#  docker-php-ext-install intl pdo_mysql zip bcmath
#
#  # nodejsインストール nvmだけ最新取得
#ENV NODE_VERSION=20.11.0
#RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
#ENV NVM_DIR=/root/.nvm
#RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
#RUN . "$NVM_DIR/nvm.sh" && nvm use ${NODE_VERSION}
#RUN . "$NVM_DIR/nvm.sh" && nvm alias default ${NODE_VERSION}
#ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
#RUN node --version
#RUN npm --version
#
#COPY ./php.ini /usr/local/etc/php/php.ini
#
#WORKDIR /data
