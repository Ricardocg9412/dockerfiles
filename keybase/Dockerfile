FROM debian:jessie
MAINTAINER AJ Bowen <aj@soulshake.net>

RUN apt-get update && apt-get install -y \
    npm \
    gnupg

RUN npm install -g keybase-installer
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN keybase-installer

ENTRYPOINT ["keybase"]
