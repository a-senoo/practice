# Node.jsとNginxでマルチビルドステージ

FROM node:18-alpine as node

RUN apk update && apk upgrade

FROM nginx:alpine
SHELL ["bin/ash","-oeux","pipefaile","-c"]

ENV TZ="Asia/Tokyo"

RUN apk update && apk update && apk add --update --no-cache --virtual=.build-dependencies g++

# node setting nodeの環境をnginxに取り込む
COPY --from=node /usr/local/bin /usr/local/bin
COPY --from=node /usr/local/lib/ /usr/local/lib
COPY --from=node /opt /opt

ENV APP_HOME /work/backend

VOLUME $APP_HOME
