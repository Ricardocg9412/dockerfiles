FROM debian:jessie
RUN apt-get update -y
RUN apt-get install -y \
    git \
    coffeescript \
    npm

WORKDIR /src
RUN git clone https://github.com/pilu/wordreference-cli.git
WORKDIR /src/wordreference-cli
RUN coffee -o lib -c src/
RUN npm install -g .
# export WORDREFERENCE_API_KEY=YOUR_API_KEY
# ln -s /usr/bin/nodejs /usr/bin/node
