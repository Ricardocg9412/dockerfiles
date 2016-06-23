FROM debian:jessie
MAINTAINER AJ Bowen <aj@soulshake.net>

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    libqt5svg5 \
    libqt5network5 \
    libqt5gui5

WORKDIR /src
RUN wget http://get.code-industry.net/public/master-pdf-editor-3.7.10_amd64.deb
RUN dpkg -i master-pdf-editor-3.7.10_amd64.deb

USER root
RUN apt-get install -y \
    qt5-default
#ln -s /usr/lib/i386-linux-gnu/dri /usr/lib/dri

RUN apt-get install -y \
    pdftk

ENTRYPOINT ["masterpdfeditor3"]


