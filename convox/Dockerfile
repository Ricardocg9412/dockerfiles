FROM debian:jessie
RUN apt-get update && apt-get install -y \
    wget

WORKDIR /src
RUN wget https://bin.equinox.io/c/jewmwFCp7w9/convox-stable-linux-amd64.tgz
RUN tar xvf convox-stable-linux-amd64.tgz -C /usr/local/bin

ENTRYPOINT ["convox"]
