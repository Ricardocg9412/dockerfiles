# Base docker image
FROM debian:jessie
MAINTAINER Christophe Boucharlat <christophe.boucharlat@gmail.com>

# Telegram Version 0.9.44

RUN apt-get update && apt-get install -y \
    apt-utils \
    dbus-x11 \
    dunst \
    hunspell-en-us \
    python3-dbus \
    software-properties-common \
    libx11-xcb1 \
    gconf2 \
    wget \
    --no-install-recommends 

RUN wget https://tdesktop.com/linux/tsetup.0.9.44.tar.xz -O /tmp/telegram.tar.xz && \
    cd /tmp/ && \
    tar xvfJ /tmp/telegram.tar.xz && \
    mv /tmp/Telegram/Telegram /usr/bin/Telegram && \
    rm -rf /tmp/{telegram.tar.xz,Telegram}

ENV QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb

RUN mkdir "/root/.TelegramDesktop"
RUN touch "/root/.TelegramDesktop/log.txt"
VOLUME ["/root/.TelegramDesktop"]

# Autorun x11vnc
CMD ["/usr/bin/Telegram"]
