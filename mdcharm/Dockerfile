FROM debian:jessie
MAINTAINER AJ Bowen <aj@soulshake.net>

RUN apt-get update && apt-get install -y \
    git \
    vim \
    wget

RUN echo "alias ll='ls -lahF'" >> $HOME/.bashrc

RUN wget https://github.com/zhangshine/MdCharm/releases/download/1.2.0/mdcharm_1.2_amd64.deb
RUN apt-get install -y \
    libglib2.0-0 \
    libqt5core5a \
    libqt5gui5 \
    libqt5network5 \
    libqt5printsupport5 \
    libqt5webkit5 \
    libqt5widgets5

RUN apt-get install -y \
    libhunspell-1.3-0 \
    libhunspell-dev

RUN dpkg -i mdcharm_1.2_amd64.deb
ENTRYPOINT ["mdcharm"]
