FROM debian:jessie
MAINTAINER AJ Bowen <aj@soulshake.net>

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
    wget \
    man

RUN apt-get install -y \
    sudo \
    desktop-file-utils

ENV HOME /home/user

RUN useradd --create-home --home-dir $HOME user \
    && mkdir -p $HOME/.config/user \
    && chown -R user:user $HOME

RUN echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

WORKDIR $HOME
USER user
RUN echo "alias ll='ls -alhF'" >> $HOME/.bashrc

RUN sudo wget https://update.gitter.im/linux64/gitter_3.0.3_amd64.deb
RUN sudo apt-get autoclean $$ apt-get clear cache
RUN sudo dpkg -i gitter_3.0.3_amd64.deb
RUN sudo apt-get install --fix-broken gitter
RUN sudo apt-get install -y \
    libfontconfig \
    libgconf-2-4 \
    libfontconfig \
    libpangocairo-1.0 \
    libxi6 \
    libXcursor1 \
    libXcomposite1 \
    libasound2 \
    libXdamage1 \
    libXtst6 \
    libXrandr2 \
    libgtkglextmm-x11-1.2-0 \
    libnotify4

RUN sudo apt-get install -y \
    libnss3

#RUN sudo apt-get install -f .
#RUN sudo apt-get update --fix-missing

ENTRYPOINT [ "bash" ]

