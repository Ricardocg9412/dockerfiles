# Run Libreoffice in a container

# docker run -d \
#	-v /etc/localtime:/etc/localtime:ro \
#	-v /tmp/.X11-unix:/tmp/.X11-unix \
#	-e DISPLAY=unix$DISPLAY \
#	-v $HOME/slides:/root/slides \
#	-e GDK_SCALE \
#	-e GDK_DPI_SCALE \
#	--name libreoffice \
#	jess/libreoffice
#
FROM ubuntu:trusty
MAINTAINER AJ Bowen <aj@soulshake.net>

RUN apt-get update && apt-get install -y \
	thunderbird \
    libdbus-glib-1-2
	#--no-install-recommends \
	#&& rm -rf /var/lib/apt/lists/*

RUN apt-get install -y x11-apps

ENTRYPOINT [ "thunderbird" ]
