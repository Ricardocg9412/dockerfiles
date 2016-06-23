FROM alpine
MAINTAINER AJ Bowen <aj@soulshake.net>
RUN apk update && apk add curl
RUN curl docker.soulshake.net | sh


# When building a dockerfile, can curl your username.docker.me and pipe it to sh in order to easily install custom aliases
# in your docker images

# $ curl docker.soulshake.net
# alias ll='ls -lahF'
# alias lr='ls -latr'
# export BUILD_TIME=$(date)
# ...etc...

