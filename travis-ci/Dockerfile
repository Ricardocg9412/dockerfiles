FROM ruby:alpine
MAINTAINER caktux
RUN apk add --no-cache build-base && \
    gem install travis && \
    gem install travis-lint && \
    apk del build-base
RUN apk add --no-cache git

ENV TRAVIS_CONFIG_PATH=$HOME/.config/travis
LABEL clink="-v $TRAVIS_CONFIG_PATH:/root/.travis"
ENTRYPOINT ["/usr/local/bundle/bin/travis"]
