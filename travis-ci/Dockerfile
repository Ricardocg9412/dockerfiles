FROM ruby:alpine
MAINTAINER caktux
RUN apk add --no-cache build-base && \
    gem install travis && \
    gem install travis-lint && \
    gem install pry && \
    apk del build-base
RUN apk add --no-cache \
    git \
    libnotify

#ENV TRAVIS_CONFIG_PATH=/home/aj/.config/travis
#LABEL clink='-v $TRAVIS_CONFIG_PATH:/home/aj/.config/travis'
ENTRYPOINT ["/usr/local/bundle/bin/travis"]
