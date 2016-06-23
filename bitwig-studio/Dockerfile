# Bitwig Studio in a container
#
# docker run -ti --rm --privileged \
#    -e DISPLAY=unix$DISPLAY \
#    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
#    -v /dev/snd:/dev/snd \
#    -v /root/.BitwigStudio:/root/.BitwigStudio \
#    -v /root/BitwigStudio:/root/BitwigStudio \
#    -v /root/Bitwig\ Studio:/root/Bitwig\ Studio \
#    -v /tmp:/tmp \
#    --name bitwig-studio \
#    soulshake/bitwig-studio:1.3.0


FROM ubuntu:14.04
MAINTAINER Jonathan Brooker <jonathan.brooker@gmail.com>

RUN apt-get update \
 && apt-get install -y \
            wget \
            libcairo2 \
            libxcb-icccm4 \
            libxcb1 \
            libxcb-randr0 \
            libx11-xcb1 \
            libxkbfile1 \ 
            libxcursor1 \
            libstdc++6 \
            libc6 \
            libgcc1 \
            libpixman-1-0 \
            libfontconfig1 \ 
            libfreetype6 \
            libpng12-0 \
            libxcb-shm0 \
            libxcb-render0 \
            libx11-6 \
            zlib1g \
            libxau6 \
            libxdmcp6 \
            libxfixes3 \
            libexpat1 \
            libxrender1 \
            libx11-6 \
            zlib1g \
            libjack-jackd2-0 \
            xdg-utils \
            libav-tools \
            zenity \
            links
ENV BITWIG_VERSION="1.3.4"
RUN  wget http://downloads.bitwig.com/stable/${BITWIG_VERSION}/bitwig-studio-${BITWIG_VERSION}.deb \
  && dpkg -i bitwig-studio-${BITWIG_VERSION}.deb \
  && rm bitwig-studio-${BITWIG_VERSION}.deb \
  && apt-get -y remove wget \
  && apt-get -y autoremove \
  && apt-get -y clean

WORKDIR /tmp

LABEL runflags="-v $HOME/.BitwigStudio"

ENTRYPOINT [ "bitwig-studio" ]
