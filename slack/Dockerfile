# Run slack desktop app in a container
#
# docker run --rm -it \
#   -v /etc/localtime:/etc/localtime:ro \
#   -v /tmp/.X11-unix:/tmp/.X11-unix \
#   -v $HOME/.config/Slack:/root/.config/Slack \
#   -e DISPLAY=unix$DISPLAY \
#   --device /dev/snd:/dev/snd \
#   --device /dev/dri:/dev/dri \
#   --name slack \
#   jess/slack

FROM ubuntu:latest
MAINTAINER AJ Bowen <aj@soulshake.net>

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gconf2 \
    gconf-service \
    gvfs-bin \
    hunspell-en-us \
    libasound2 \
    libgnome-keyring0 \
    libgtk2.0-0 \
    libnotify4 \
    libnss3 \
    libxss1 \
    libxtst6 \
    locales \
    python \
    xdg-utils \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen en_US.utf8 \
    && /usr/sbin/update-locale LANG=en_US.UTF-8

ENV SLACK_VERSION 2.0.5

ENV url="https://downloads.slack-edge.com/linux_releases/slack-desktop-${SLACK_VERSION}-amd64.deb"
RUN curl -sSL ${url} > /tmp/slack-desktop.deb \
    && dpkg -i /tmp/slack-desktop.deb \
    && rm -rf /tmp/slack-desktop.deb

LABEL clink="-d -v $HOME/.config/Slack:/root/.config/Slack"
ENTRYPOINT ["slack"]
