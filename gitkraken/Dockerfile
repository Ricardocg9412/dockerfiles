FROM debian:jessie
MAINTAINER AJ Bowen <aj@soulshake.net>

RUN apt-get update && apt-get install -y \
    wget

WORKDIR /src
RUN wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
RUN apt-get install -y \
    gconf2 \
    gconf-service \
    libgtk2.0-0 \
    libnotify4 \
    libxtst6 \
    libnss3 \
    python \
    gvfs-bin \
    xdg-utils

RUN dpkg -i /src/gitkraken-amd64.deb
LABEL clink="-v /home/aj/.config/gitkraken:$HOME/.gitkraken"
ENTRYPOINT ["bash"]
#CMD ["gitkraken"]
