FROM fluent/fluentd:v1.7.4-1.0
MAINTAINER Chris Garrett (https://github.com/chris-garrett/docker-fluentd)
LABEL description="Fluent  on Alpine for shipping logs to Elastic"

COPY ./scripts/bash_profile /home/fluent/.bash_profile
COPY ./scripts/bashrc /home/fluent/.bashrc
COPY ./scripts/vimrc /home/fluent/.vimrc
ADD ./fluent.conf /fluentd/etc/fluent.conf

USER root

RUN set -ex \
  && apk --no-cache add -U --virtual build-deps \
    build-base \
    ruby-dev \
  && gem install fluent-plugin-elasticsearch --no-rdoc --no-ri --version 3.7.0 \
  && gem install fluent-plugin-record-modifier --no-rdoc --no-ri --version 2.0.1 \
  && gem install fluent-plugin-s3 --no-rdoc --no-ri --version 1.2.1 \
  && apk del build-deps \
  && apk --no-cache add -U \
    vim \
  && ln -sf /usr/bin/vim /usr/bin/vi \
  && wget https://github.com/jwilder/dockerize/releases/download/v0.6.1/dockerize-alpine-linux-amd64-v0.6.1.tar.gz \
  && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-v0.6.1.tar.gz \
  && rm dockerize-alpine-linux-amd64-v0.6.1.tar.gz \
  && chown -R fluent:fluent /home/fluent \
  && addgroup -g 1000 fluentmount \
  && addgroup fluent fluentmount 

USER fluent
